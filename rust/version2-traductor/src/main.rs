use std::collections::HashMap;
use warp::Filter;

#[tokio::main]
async fn main() {

    let route =
        warp::query::<HashMap<String,String>>()
        .map(|params| {

            let numero =
                params.get("n")
                .unwrap();

            let resultado =
                match numero.as_str() {

                    "10" => "diez",
                    "20" => "veinte",
                    "30" => "treinta",
                    _ => "sin traducción"
                };

            resultado.to_string()
        });

    warp::serve(route)
        .run(([127,0,0,1],8000))
        .await;
}