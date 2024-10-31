const APILINK =
    "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=09e2a45c9bfe6b3a0e85ec241a77b3af&page=1";
const IMG_PATH = "https://image.tmdb.org/t/p/w1280";
const SEARCHAPI = "https://api.themoviedb.org/3/search/movie?api_key=09e2a45c9bfe6b3a0e85ec241a77b3af&query=";

const main = document.querySelector("#section");
const form = document.querySelector("#form");
const search = document.querySelector("#query");

function returnMovies(url) {
    fetch(url)
        .then((res) => res.json())
        .then((data) => {
            console.log(data.results);
            // biome-ignore lint/complexity/noForEach: <explanation>
            data.results.forEach((element) => {
                const div_card = document.createElement("div");
                div_card.setAttribute("class", "card");
                const div_row = document.createElement("div");
                div_card.setAttribute("class", "row");
                const div_column = document.createElement("div");
                div_card.setAttribute("class", "column");
                const image = document.createElement("img");
                image.setAttribute("class", "thumbnail");
                image.setAttribute("id", "title");
                const title = document.createElement("h3");

                title.innerHTML = `${element.title}`;
                image.src = IMG_PATH + element.poster_path;

                div_card.appendChild(image);
                div_card.appendChild(title);
                div_column.appendChild(div_card);
                div_row.appendChild(div_column);

                main.appendChild(div_row);
            });
        })
        .catch((error) => console.error(error));
}
returnMovies(APILINK);

form.addEventListener("submit", (e) => {
    e.preventDefault();
    main.innerHTML = "";

    const searchItem = search.value;

    if (searchItem) {
        returnMovies(SEARCHAPI + searchItem);
        search.value = "";
    }
});
