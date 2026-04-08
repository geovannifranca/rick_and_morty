# Rick and Morty

Este repositório é o desafio final do módulo 6 (Animações e integração com API) da Growdev, apicação Flutter moderna e performática que explora o vasto e divertido universo de Rick and Morty, consumindo a [Rick and Morty API](https://rickandmortyapi.com/). Este projeto demonstra as melhores práticas de desenvolvimento mobile, com foco em reatividade, performance e uma experiência de usuário imersiva.

## 🚀 Funcionalidades

*   **Listagem Dinâmica de Personagens**: Visualize personagens em layouts de lista ou grade, com informações essenciais como nome, espécie e status.
*   **Scroll Infinito (Paginação)**: Carregamento eficiente de dados sob demanda, otimizando o uso de recursos e proporcionando uma navegação fluida por um grande volume de personagens.
*   **Busca Avançada em Tempo Real**: Filtre personagens instantaneamente por nome ou identificador, facilitando a localização de seus favoritos.
*   **Tematização Adaptativa e Imersiva**: Utiliza `PaletteGenerator` para extrair dinamicamente as cores dominantes das imagens dos personagens, aplicando-as à interface para uma experiência visualmente rica e personalizada.
*   **Detalhes Ricos do Personagem**: Explore telas de detalhes com animações `Hero` para transições suaves, exibindo informações completas sobre a origem, localização e episódios em que cada personagem aparece.
*   **Cache de Imagens Inteligente**: Gerenciamento otimizado de cache para imagens de rede, reduzindo o consumo de dados, melhorando os tempos de carregamento e a performance geral da aplicação.

## 🛠️ Tecnologias e Arquitetura

O projeto foi meticulosamente construído utilizando um conjunto robusto de tecnologias e seguindo as melhores práticas de arquitetura para desenvolvimento mobile:

*   **Flutter SDK**: O framework líder para desenvolvimento de aplicações multiplataforma, garantindo uma interface de usuário nativa e de alta performance.
*   **MobX**: Uma solução poderosa para gerenciamento de estado reativo, que simplifica a lógica de negócios e a sincronização da UI com os dados.
*   **GetIt**: Um *Service Locator* leve e eficiente para injeção de dependências, promovendo um alto nível de desacoplamento e testabilidade do código.
*   **Palette Generator**: Biblioteca essencial para a extração de cores de imagens, permitindo a criação de interfaces dinâmicas e visualmente atraentes.
*   **Cached Network Image**: Uma ferramenta robusta para o carregamento, cache e exibição de imagens de rede, com suporte a *placeholders* e tratamento de erros.
*   **CustomScrollView & Slivers**: Componentes avançados do Flutter para a criação de efeitos de rolagem complexos e *AppBars* colapsáveis, proporcionando uma experiência de usuário sofisticada.

## 📂 Estrutura do Projeto

A organização do código segue uma estrutura modular e escalável, facilitando a manutenção e a adição de novas funcionalidades:

```
lib/
 ├── models/         # Definições de modelos de dados e lógica de serialização/desserialização JSON.
 ├── screens/        # Implementação das telas principais da aplicação (e.g., Home, Detail).
 ├── services/       # Camada de abstração para consumo da API e outras interações externas.
 ├── store/          # Lógica de negócio e gerenciamento de estado reativo utilizando MobX.
 ├── widgets/        # Componentes de UI reutilizáveis e independentes de estado.
 └── main.dart       # Ponto de entrada da aplicação e configuração inicial de dependências.
```

## 🚦 Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas em seu ambiente de desenvolvimento:

*   **Flutter SDK**: Versão 3.x ou superior. [Instruções de instalação](https://flutter.dev/docs/get-started/install)
*   **Dart SDK**: Incluído no Flutter SDK.

## 🔧 Instalação e Execução

Siga os passos abaixo para configurar e executar o projeto em sua máquina local:

1.  **Clone o repositório**:
    ```bash
    git clone https://github.com/geovannifranca/rick_and_morty.git
    cd rick_and_morty
    ```
2.  **Instale as dependências**:
    ```bash
    flutter pub get
    ```
3.  **Gere os arquivos do MobX** (se necessário, para *code generation*):
    ```bash
    flutter pub run build_runner build
    ```
4.  **Execute a aplicação**:
    ```bash
    flutter run
    ```



## 📄 Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 📞 Contato
Geovanni França - [LinkedIn](https://www.linkedin.com/in/geovannidefranca/)

Link do Projeto: [https://github.com/geovannifranca/rick_and_morty](https://github.com/geovannifranca/rick_and_morty)

---

Desenvolvido por Geovanni França.
