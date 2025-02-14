// Capturando os elementos h1 e a
let titulo = document.getElementById('titulo');
let link = document.querySelector('a');

// Adicionando conteúdo textual neles
titulo.innerText = 'Temas estudados';
link.innerText = 'Site da Proz';

// Capturando os elementos ul e ol
let listaNaoOrdenada = document.querySelector('ul');
let listaOrdenada = document.querySelector('ol');

// Adicionando três itens simples na lista não ordenada
listaNaoOrdenada.innerHTML = `
  <li>HTML</li>
  <li>CSS</li>
  <li>JavaScript</li>
`;
// Adicionando três itens com links na lista ordenada
listaOrdenada.innerHTML = `
  <li><a href="https://www.google.com">Google</a></li>
    <li><a href="https://www.youtube.com">YouTube</a></li>
    <li><a href="https://www.github.com">GitHub</a></li>
`;