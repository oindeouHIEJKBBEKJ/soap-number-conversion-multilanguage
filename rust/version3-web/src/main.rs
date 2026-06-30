use std::collections::HashMap;
use warp::Filter;
use num2words::Num2Words;

#[tokio::main]
async fn main() {

    let route =
        warp::query::<HashMap<String,String>>()
        .map(|params| {

            let numero: i64 =
                params.get("n")
                .unwrap()
                .parse()
                .unwrap();

            Num2Words::new(numero)
                .lang(num2words::Lang::Spanish)
                .to_words()
                .unwrap()
        });

    warp::serve(route)
        .run(([127,0,0,1],8000))
        .await;
}