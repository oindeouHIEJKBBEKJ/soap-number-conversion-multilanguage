use std::collections::HashMap;
use std::convert::Infallible;
use warp::Filter;

#[tokio::main]
async fn main() {

    let route = warp::path::end()
        .and(warp::query::<HashMap<String, String>>())
        .and_then(handler);

    println!("Servidor en puerto 8000");

    warp::serve(route)
        .run(([127, 0, 0, 1], 8000))
        .await;
}

async fn handler(
    params: HashMap<String, String>,
) -> Result<impl warp::Reply, Infallible> {

    let numero =
        params.get("n")
        .unwrap_or(&"10".to_string());

    let body = format!(
r#"<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
<soap:Body>
<NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
<ubiNum>{}</ubiNum>
</NumberToWords>
</soap:Body>
</soap:Envelope>"#,
numero
);

    let client = reqwest::Client::new();

    let response =
        client
        .post(
        "https://www.dataaccess.com/webservicesserver/NumberConversion.wso"
        )
        .header(
            "Content-Type",
            "text/xml; charset=utf-8"
        )
        .body(body)
        .send()
        .await;

    match response {
        Ok(r) => {
            let text =
                r.text().await.unwrap();
            Ok(text)
        }
        Err(_) => {
            Ok("Error SOAP".to_string())
        }
    }
}