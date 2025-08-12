##########################################################
#   Quadro difusor de som usando madeira
##########################################################

# Definição:
# Quadro onde irei adicionar peças de madeira quadradas (x por y) de 5cm por 5cm. 
# O desafio aqui é que essas peças de madeira tem 5 alturas (eixo z) diferentes.
# Fiz a distribuição espacial dessas peças assumindo um processo Poisson homogêneo. 
# Na parte da arte, para esse mesmo problema montei um padrão não homogêneo,   
# tentando fazer um desenho nessas peças com diferentes alturas,
# como se fosse uma tendência ou um círculo partindo do centro do quadro usando
# uma paleta de cores.
# 
# Observações:
# 
# Cor e Altura são as variáveis envolvidas 
# lambda: parâmetro de média que controla a intensidade 
#  do processo Poisson para alturas.
# raio_circulo: Ajusta o tamanho da tendência circular.
# angulo_tendencia: Define a direção da tendência linear:
#   0: Horizontal.
#  45: Diagonal.
#  30: Inclinação intermediária.
################################################################

# Configurações iniciais
set.seed(123)  # Para reprodutibilidade
linhas <- 11  # Número de linhas do tabuleiro (55 cm / 5 cm)
colunas <- 23  # Número de colunas do tabuleiro (115 cm / 5 cm)
tabuleiro_tendencia <- matrix(0, nrow = linhas, ncol = colunas)  # Tabuleiro para tendência
tabuleiro_circulo <- matrix(0, nrow = linhas, ncol = colunas)  # Tabuleiro para círculo

# Parâmetros ajustáveis
numero_cores <- 6  # Quantidade de cores disponíveis
#distribuicao_cores Proporções das cores (deve somar 1)
distribuicao_cores <- c(0.1, 0.2, 0.25, 0.25, 0.15, 0.05)
numero_alturas <- 5
dim_alt<- c(1, 2, 4, 6, 8)  # Alturas possíveis em cm
# Parâmetro de ângulo da tendência (em graus)
angulo_tendencia <- 40
# Parâmetro para o tamanho da circunferência
raio_circulo <- 2.5  # Controla o tamanho dos círculos (raio maior = círculos mais largos)

# Gerar alturas usando um processo Poisson homogêneo
# Função para sortear alturas (processo Poisson homogêneo)
lambda=2.5 # parâmetro de média da Poisson
alturas <- rpois(linhas*colunas, lambda = lambda) %% numero_alturas + 1 # Valores ajustados para o intervalo de alturas
#alturas <- sample(dim_alt, size = linhas*colunas, replace = TRUE) #processo aleatório simples

# Função para gerar cores com a distribuição desejada
dimensoes <- 1:numero_cores  # cores possíveis
sortear_cor <- function() {
  sample(dimensoes, size = 1, prob = distribuicao_cores)
}

# Função para calcular a tendência com base no ângulo
calcular_tendencia <- function(i, j, angulo) {
  rad <- pi * angulo / 180  # Converter para radianos
  posicao_projetada <- i * sin(rad) + j * cos(rad)  # Projeção da posição (linha, coluna)
  d<-dimensoes[ceiling(posicao_projetada / max(linhas, colunas) * length(dimensoes))]  # Normalizar para cores
  if (is.na(d)){d<-max(dimensoes)}
  d
}

# Função para adicionar aleatoriedade controlada
adicionar_aleatoriedade <- function(valor_base) {
  valor_base + sample(-1:1, 1)  # Adiciona um desvio de -1, 0 ou +1
}

# Garantir que valores fiquem dentro do intervalo permitido
limitar_valores <- function(valor) {
  min(max(valor, min(dimensoes)), max(dimensoes))  # Limita os valores entre o menor e o maior nível
}

# 1. Tendência com base no ângulo
for (i in 1:linhas) {
  for (j in 1:colunas) {
    cor_base <- calcular_tendencia(i, j, angulo_tendencia)  # cor baseada no ângulo
    cor_aleatoria <- adicionar_aleatoriedade(cor_base)
    tabuleiro_tendencia[i, j] <- limitar_valores(cor_aleatoria)
  }
}

# 2. Círculo concêntrico com tamanho ajustável e distribuição controlada
centro <- c((linhas + 1) / 2, (colunas + 1) / 2)  # Centro do tabuleiro
for (i in 1:linhas) {
  for (j in 1:colunas) {
    distancia <- sqrt((i - centro[1])^2 + (j - centro[2])^2) / raio_circulo
    cor_base <- dimensoes[min(ceiling(distancia), length(dimensoes))]  # cor baseada na distância
    cor_aleatoria <- adicionar_aleatoriedade(cor_base)
    tabuleiro_circulo[i, j] <- limitar_valores(cor_aleatoria)
  }
}

# Função para visualizar o tabuleiro
library(ggplot2)
library(reshape2)

visualizar_tabuleiro <- function(tabuleiro, titulo) {
  df <- melt(tabuleiro)
  df$alturas <- alturas
  colnames(df) <- c("Linha", "Coluna", "Cor", "Alturas")
  ggplot(df, aes(x = Coluna, y = Linha)) +
    geom_tile(aes(fill = factor(Cor)), color = "black") +  # Usando Cor para o preenchimento
    geom_text(aes(label = Alturas, color = factor(Alturas)), size = 3) +  # Exibindo Altura com legenda
    scale_fill_manual(
      values = colorRampPalette(c("#D9D9D9", "#595959"))(numero_cores),
      name = "Cor"
    ) +  # Tons de cinza para Cor com legenda
    scale_color_manual(
      values = colorRampPalette(c("blue", "red"))(length(unique(df$Alturas))),
      name = "Alturas"
    ) +  # Paleta para Alturas
    theme_minimal() +
    labs(title = titulo) +  # Ajuste o título conforme necessário
    scale_y_reverse()  # Inverter o eixo Y, se necessário
}
# só as cores
visualizar_tabuleiro2 <- function(tabuleiro, titulo) {
  df <- melt(tabuleiro)
  df$alturas <- alturas
  colnames(df) <- c("Linha", "Coluna", "Cor", "Alturas")
  ggplot(df, aes(x = Coluna, y = Linha)) +
    geom_tile(aes(fill = factor(Cor)), color = "black") +  # Usando Cor para o preenchimento
    geom_text(aes(label = Cor), size = 3, color = "black") +  # Exibindo o código da cor no centro
    scale_fill_manual(
      values = colorRampPalette(c("#D9D9D9", "#595959"))(numero_cores),
      name = "Cor"
    ) +  # Tons de cinza para Cor com legenda
    theme_minimal() +
    labs(title = titulo) +  # Usando o título passado como argumento
    scale_y_reverse()  # Inverter o eixo Y, se necessário
}
#Só as alturas
visualizar_tabuleiro_altura <- function(tabuleiro, titulo) {
  df <- melt(tabuleiro)
  df$alturas <- alturas
  colnames(df) <- c("Linha", "Coluna", "Cor", "Alturas")
#Plotar apenas as Alturas
ggplot(df, aes(x = Coluna, y = Linha, fill = factor(Alturas))) +
  geom_tile(color = "black") +
  scale_fill_manual(values = c("red", "orange", "yellow", "green", "blue")) +
  theme_minimal() +
  labs(fill = "Alturas", title = "Distribuição de Alturas no Tabuleiro") +
  scale_y_reverse()
}

# Visualizar os tabuleiros
plot_tendencia <- visualizar_tabuleiro(tabuleiro_tendencia, paste0("Tendência com Ângulo de ", angulo_tendencia, "°"))
plot_tendencia2 <- visualizar_tabuleiro2(tabuleiro_tendencia, paste0("Tendência com Ângulo de ", angulo_tendencia, "°"))
plot_circulo <- visualizar_tabuleiro(tabuleiro_circulo, paste0("Círculos com Raio Ajustável (Raio = ", raio_circulo, ")"))
plot_alt <- visualizar_tabuleiro_altura(tabuleiro_circulo, paste0("Distribuição de Alturas no Tabuleiro"))
print(plot_tendencia)
print(plot_tendencia2)
print(plot_circulo)
print(plot_alt)

df <- melt(tabuleiro_tendencia)
df$alturas <- alturas
colnames(df) <- c("Linha", "Coluna", "Cor", "Alturas")
table(df$Cor) # número de peças por cor
table(df$Alturas) # número de peças por alturas
table(df$Cor,df$Alturas) # número de peças em cada altura e cor
length(alturas) #total de peças

#Quantidade de madeira em metros (Esses tarugos são normalmente vendidos com 3m)
perdacorte=0.5 #em cm, depende da lamina de corte
(QM<-table(df$Alturas)[1]*dim_alt[1]+table(df$Alturas)[2]*dim_alt[2]+table(df$Alturas)[3]*dim_alt[3]+
    table(df$Alturas)[4]*dim_alt[4]+table(df$Alturas)[5]*dim_alt[5]+((length(alturas)-1)*perdacorte))/100