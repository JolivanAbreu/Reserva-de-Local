const backToTopButton = document.querySelector("#voltar");

backToTopButton.onclick = () =>
    document.documentElement.scroll({
        top: 0,
        behavior: "smooth"
    })

window.onscroll = () => {
    backToTopButton.hidden = !(document.documentElement.scrollTop > 200)
}

/*SCRIPT REFERENTE AS IMAGENS*/
function previewImage(event) {
    var input = event.target;
    var reader = new FileReader();
    reader.onload = function () {
        var dataURL = reader.result;
        var image = document.createElement('img');
        image.src = dataURL;
        document.getElementById('imagePreview').innerHTML = '';
        document.getElementById('imagePreview').appendChild(image);
    };
    reader.readAsDataURL(input.files[0]);
}
/*SCRIPT REFERENTE AS IMAGENS*/

/* VISUALIZAÇÃO DE SENHA */



/* VISUALIZAÇÃO DE SENHA */