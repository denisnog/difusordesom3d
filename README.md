MODELANDO A DISPERSÃO SONORA

Com a moldura em mãos e a ideia clara, o próximo passo foi a materialização do conceito. 
A escolha da matéria-prima recaiu sobre caibros de pinho quadrados (5x5cm), encontrados em uma madeireira local. 
A partir daí, o desafio era preencher a moldura com blocos de madeira de diferentes alturas, de forma a criar 
uma distribuição espacial que simulasse comportamento por um Processo de Poisson homogêneo. Este processo, 
fundamental na estatística, descreve a ocorrência de eventos em um espaço de forma aleatória e independente, 
com uma taxa de ocorrência constante. No contexto do difusor, isso significava que a distribuição da altura de 
cada bloco seria determinada por uma distribuição de Poisson, garantindo uma variação natural e não uniforme, 
essencial para a dispersão eficaz do som.

Para auxiliar nesse processo de modelagem e simulação foi utilizado o software R, uma ferramenta poderosa para 
análise estatística e computação gráfica. A ideia era gerar uma matriz de dispersão espacial das alturas, 
gerando a ocorrência para cada posição dentro da moldura, onde cada valor representaria a altura de um bloco 
de madeira. Dada a natureza manual do corte das peças e da pintura, optou-se por limitar a variável Altura a 
apenas cinco tamanhos distintos: 1, 2, 4, 6 e 8 centímetros. Essa simplificação não apenas facilitaria o 
processo de construção, mas também permitiria um controle maior sobre o resultado final, sem comprometer a 
aleatoriedade da distribuição.

A média do processo de Poisson foi definida como 2,5, um valor que, após simulações e testes, mostrou-se ideal 
para gerar uma distribuição de alturas visualmente interessante e funcionalmente eficaz. A beleza da Estatística 
reside justamente nessa capacidade de transformar conceitos abstratos em parâmetros concretos, que guiam a 
criação de algo tangível. O código em R, desenvolvido para este fim, permitiu simular diferentes cenários e 
visualizar a distribuição das alturas antes mesmo de qualquer corte ser feito, otimizando o processo e minimizando 
desperdícios.

A ARTE DAS CORES

Além da variação de altura, que já é deslumbrante, a dimensão artística do projeto também foi explorada através 
da aplicação de cor. A ideia era criar um degradê, adicionando um toque visual que complementasse a funcionalidade 
acústica. Após experimentações com degradês lineares e circulares, a opção linear foi a escolhida, por sua elegância 
e capacidade de guiar o olhar através da peça. Para isso, foram selecionados seis tons de cinza, variando do mais 
claro ao mais escuro, na prática do branco ao preto, criando uma transição que podemos dizer suave e harmoniosa.

A direção da tendência do degradê foi definida como um parâmetro no código R, permitindo flexibilidade para explorar
diferentes orientações e encontrar a mais artística. A possibilidade de atribuir pesos diferentes a cada tom de cinza 
também foi incorporada, conferindo maior variação artística e profundidade à composição. Essa abordagem parametrizada, 
tão comum na estatística e na programação, revelou-se uma ferramenta valiosa para a expressão criativa, permitindo 
que a arte fosse guiada por princípios numéricos, mas com espaço para a intuição e o gosto pessoal.

O processo de pintura, embora manual, foi meticulosamente planejado. Cada bloco de madeira, após ser posicionado 
pela simulação em R, e cortado na altura determinada, receberia um dos seis tons de cinza, de acordo com a posição e
a tendência do degradê. O resultado é um quadro que, de perto, revela a individualidade de cada bloco de madeira e, 
de longe, apresenta uma composição coesa e visualmente impactante, onde a aleatoriedade das alturas se encontra com 
a ordem do degradê de cores.
