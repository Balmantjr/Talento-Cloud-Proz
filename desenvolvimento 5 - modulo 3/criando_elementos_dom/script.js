// Método Simples: Adicionando um título ao site
const titulo = document.createElement('h1');
titulo.id = 'titulo';
titulo.innerText = 'Loja de Produtos';
document.body.appendChild(titulo);

// Método Complexo: Criando um elemento de produto
const produto = document.createElement('div');
produto.classList.add('produto');

// Nome do Produto
const nomeProduto = document.createElement('h2');
nomeProduto.innerText = 'Notebook Gamer';
produto.appendChild(nomeProduto);

// Descrição do Produto
const descricaoProduto = document.createElement('p');
descricaoProduto.innerText = 'Notebook Gamer com processador Intel i7, 16GB de RAM, SSD de 512GB e placa de vídeo NVIDIA GTX 1650.';
produto.appendChild(descricaoProduto);

// Preço do Produto
const precoProduto = document.createElement('p');
precoProduto.innerText = 'Preço: R$ 5.499,99';
produto.appendChild(precoProduto);

// Imagem do Produto
const imagemProduto = document.createElement('img');
imagemProduto.src = 'https://via.placeholder.com/200';
imagemProduto.alt = 'Notebook Gamer';
produto.appendChild(imagemProduto);

// Adicionando o produto ao body
document.body.appendChild(produto);