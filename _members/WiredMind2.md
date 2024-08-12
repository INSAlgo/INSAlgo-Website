---
short_name: WiredMind
github_username: WiredMind2
name: William Michaud
position: Trésorier
year: 2024
display_page: "false"  # This particular page will not generate an output page
---

## Qui suis-je ?

Je m'appelle **William** et je suis en **troisième année** d'études dans le département **IF**. Je suis un passionné d'informatique, plus particulièrement en **Python**. C'est un langage simple mais puissant, toujours très efficace pour résoudre des problèmes d'algorithmie ;-).

## Concours et Compétitions

En dehors des cours, j'aime participer à des **concours de programmation**. Ces compétitions sont pour moi l'occasion de tester mes connaissances, de relever des défis techniques, et d'apprendre au contact d'autres passionnés. Elles me poussent à me dépasser et à développer de nouvelles compétences. J'ai donc rejoint le bureau INSAlgo cette année car je voulais participer à l'élaboration de l'un de ces concours!

### Random Fun Fact:

<p id="fun_fact">...</p>

<script>
var url = "https://uselessfacts.jsph.pl/api/v2/facts/random";
var xhr = new XMLHttpRequest();
xhr.open("GET", url, true);
xhr.setRequestHeader("Content-Type", "application/json");


xhr.onload = function() {
  if (xhr.status === 200) {
    // Request was successful
    var response = JSON.parse(xhr.responseText);
	document.getElementById("fun_fact").innerText = response.text;

    console.log(response);
  } else {
    // Request failed
    console.log("Error: " + xhr.status);
  }
};

xhr.send();
</script>

<br/>

Merci de votre visite, et n'hésitez pas à laisser vos commentaires !

<a href="https://sharevault.cloud/W2ZCD1" title="Oui, j'ai généré la moitié de cette page avec ChatGPT ;)" style="color: inherit;
  text-decoration: inherit;">_William_</a>


