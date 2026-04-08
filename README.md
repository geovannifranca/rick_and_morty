# Rick and Morty Explorer

Uma aplicação Flutter moderna e performática que explora o universo de Rick and Morty, consumindo a [Rick and Morty API](https://rickandmortyapi.com/).

## 🚀 Funcionalidades

- **Listagem Dinâmica**: Visualização de personagens em formatos de Lista ou Grid.
- **Scroll Infinito**: Carregamento sob demanda (pagination) conforme a navegação do usuário.
- **Busca Avançada**: Filtragem de personagens por nome ou identificador em tempo real.
- **Tematização Adaptativa**: Utiliza `PaletteGenerator` para extrair cores dominantes das imagens dos personagens e aplicá-las dinamicamente à interface.
- **Detalhes Ricos**: Tela de detalhes com animações `Hero`, informações de origem, localização e episódios.
- **Cache de Imagens**: Gerenciamento eficiente de cache para otimizar o consumo de dados e performance.

## 🛠️ Tecnologias e Arquitetura

O projeto foi construído utilizando as melhores práticas de desenvolvimento mobile:

- **Flutter SDK**: Framework principal.
- **MobX**: Gerenciamento de estado reativo e eficiente.
- **GetIt**: Service Locator para injeção de dependências, promovendo desacoplamento.
- **Palette Generator**: Extração de cores dinâmicas para uma UI imersiva.
- **Cached Network Image**: Persistência local de imagens e placeholder management.
- **CustomScrollView & Slivers**: Para efeitos de scroll avançados e AppBar colapsável.

## 📂 Estrutura de Pastas

```text
lib/
 ├── models/         # Modelos de dados e serialização JSON.
 ├── screens/        # Telas principais da aplicação (Home, Detail).
 ├── store/          # Lógica de negócio e gerenciamento de estado (MobX).
 ├── widgets/        # Componentes reutilizáveis (Cards, ListViews, Grids).
 └── main.dart       # Ponto de entrada e configuração do GetIt.
```

## 🚦 Pré-requisitos

- Flutter (versão 3.x ou superior)
- Dart SDK

## 🔧 Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/rick_and_morty.git
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Gere os arquivos do MobX (se necessário):
   ```bash
   flutter pub run build_runner build
   ```

4. Execute o projeto:
   ```bash
   flutter run
   ```

## 📝 Decisões de Engenharia

- **State Management**: A escolha pelo MobX foi baseada na sua capacidade de lidar com estados complexos de forma transparente, facilitando a reatividade entre o filtro de busca e a renderização da lista.
- **UI Dinâmica**: A implementação do `PaletteGenerator` nos cards transforma a experiência do usuário, tornando a interface visualmente única para cada personagem.
- **Performance de Lista**: O uso de `SliverGridDelegateWithFixedCrossAxisCount` e controle manual de scroll garante que a aplicação mantenha 60 FPS mesmo com grandes volumes de dados.

---
Desenvolvido por Geovanni.
