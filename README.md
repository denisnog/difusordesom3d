CONSTRUINDO UM DIFUSOR DE SOM 3D COM ARTE E ESTATÍSTICA

MODELANDO A DISPERSÃO SONORA

Com a moldura em mãos e a ideia já bem definida, o próximo passo era dar vida ao conceito. Peças de madeira em formato 
quadrados (5x5cm) pareciam ser a escolha mais natural por serem facilmente encontrados em madeireiras. A partir daí, 
o desafio era preencher a moldura com blocos de madeira de diferentes alturas, de modo a criar uma distribuição espacial 
que simulasse o comportamento de um Processo de Poisson homogêneo. Esse processo, fundamental na Estatística Espacial, 
descreve a ocorrência de eventos em um espaço de forma aleatória e independente, com uma taxa de ocorrência constante. 
No contexto do difusor, isso significava que a altura de cada bloco seria determinada por uma distribuição de Poisson,
garantindo uma variação natural e não uniforme, essencial para uma dispersão sonora eficaz.

Para auxiliar nesse complexo processo de modelagem e simulação, utilizei o software R, uma ferramenta incrivelmente
poderosa para análise estatística. A ideia era gerar uma matriz de dispersão espacial das alturas, gerando por simulação
a ocorrência para cada posição dentro da moldura, onde cada valor representaria a altura de um bloco de madeira. 
Dada a natureza artesanal do corte das peças e da pintura, optei por limitar a variável Altura a apenas cinco tamanhos 
distintos: 1, 2, 4, 6 e 8 centímetros. Essa simplificação não só facilitaria o processo de construção, mas também 
permitiria um controle mais preciso sobre o resultado final, sem comprometer a aleatoriedade da distribuição.

A média do processo de Poisson foi estabelecida em 2,5, um valor que, após inúmeras simulações e testes, mostrou-se 
ideal para gerar uma distribuição de alturas que fosse visualmente interessante e funcionalmente eficaz. A verdadeira 
beleza da Estatística reside justamente nessa capacidade de transformar conceitos abstratos em parâmetros concretos, 
que servem como guia para a criação de algo tangível. O código em R, desenvolvido especificamente para este propósito, 
permitiu simular diferentes cenários e visualizar a distribuição das alturas antes mesmo de qualquer corte ser feito, 
otimizando todo o processo e minimizando desperdícios.


ADICIONANDO A DIMENSÃO ARTÍSTICA

Além da variação de altura, que por si só já é um espetáculo visual, devido ao efeito 3D, a dimensão artística do projeto 
foi amplamente explorada através da aplicação cuidadosa das cores. A ideia era criar um degradê sutil, adicionando um 
toque visual que complementasse de forma harmoniosa a funcionalidade acústica. Após teste visuais com degradês lineares 
e circulares, a opção linear foi a escolhida, por sua elegância e sua capacidade de guiar o olhar através das peças. 
Para isso, selecionei seis tons de cinza, que variavam do mais claro ao mais escuro – na prática, do branco ao preto –, 
criando uma transição que pode ser descrita como suave e perfeitamente harmoniosa.

A direção da tendência do degradê foi definida como um parâmetro flexível no código R, permitindo explorar diferentes 
orientações e encontrar a que fosse mais artisticamente impactante. A possibilidade de atribuir pesos distintos a cada 
tom de cinza também foi incorporada, conferindo uma variação artística ainda maior e uma profundidade notável à composição.
Essa abordagem parametrizada, tão comum na estatística e na programação, revelou-se uma ferramenta funcional para a 
expressão criativa, permitindo que a arte fosse guiada por princípios numéricos, mas sempre com um generoso espaço para 
a intuição e o gosto pessoal.

O processo de pintura, embora totalmente manual, foi meticulosamente planejado. Cada bloco de madeira, após ser posicionado 
pela simulação em R e cortado na altura determinada, receberia um dos seis tons de cinza, de acordo com sua posição e a 
tendência do degradê. O resultado final é um quadro que, de perto, revela a individualidade e a textura de cada bloco de 
madeira e, de longe, apresenta uma composição coesa e visualmente impactante, onde a aleatoriedade das alturas se encontra 
em perfeita sintonia com o degradê de cores.
