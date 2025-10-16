# PUBG Verso - Design System

## Objetivo do Projeto

PUBG Verso é um aplicativo desenvolvido para a comunidade de jogadores de **PUBG (PlayerUnknown's Battlegrounds)**. Como um jogo competitivo e estratégico, a escolha do armamento e dos equipamentos corretos é crucial para a vitória. A ideia do PUBG Verso nasceu da necessidade de uma ferramenta clara e eficiente para comparar armas, analisar os efeitos dos acessórios e ajudar os jogadores a tomar as melhores decisões táticas.

O aplicativo permite que os usuários comparem diferentes armas, visualizem como os acessórios (como miras, coronhas e carregadores) afetam seu desempenho e, assim, determinem a configuração ideal para cada situação de combate.

---

## Arquitetura

O projeto foi desenvolvido em **Flutter** e estruturado em torno de um **Design System**, que garante consistência visual e reutilização de código. A arquitetura é organizada da seguinte forma:

- **Components**: Contém todos os widgets reutilizáveis da interface do usuário (UI), como botões, cards, inputs e avatares. Cada componente é dividido em:
    - **View**: O arquivo `.dart` que constrói o widget.
    - **ViewModel**: Uma classe que gerencia o estado e a lógica do componente, separando a UI da lógica de negócios.

- **Samples**: Contém telas de exemplo que demonstram o uso de cada componente do Design System. Isso serve como um guia prático para desenvolvedores, mostrando como instanciar e customizar os widgets.

- **Shared**: Armazena recursos compartilhados em todo o aplicativo, como cores (`colors.dart`), estilos de texto (`styles.dart`) e constantes (`app_constants.dart`).

---

## Como Executar o Projeto

Para executar este projeto em sua máquina local, siga os passos abaixo:

1. **Crie um novo projeto Flutter:**
   ```bash
   flutter create nome_do_seu_projeto
   ```
   Acesse a pasta lib do projeto recém-criado e clone o repositório:

   ```bash
   cd nome_do_seu_projeto/lib
   git clone https://github.com/seu-usuario/pubg-verso-design-system.git .
   ```

   Substitua o arquivo main.dart:

   O main.dart clonado já contém a estrutura necessária para rodar o aplicativo de amostra.

   **Adicione as dependências:**

   Certifique-se de que o arquivo `pubspec.yaml` na raiz do seu projeto esteja configurado corretamente (veja o modelo abaixo).

   Execute o comando para instalar as dependências:

   ```bash
   flutter pub get
   ```

   Execute o aplicativo:

   ```bash
   flutter run
   ```

### pubspec.yaml de Referência

Para garantir que o projeto funcione corretamente, seu `pubspec.yaml` deve estar alinhado com o seguinte modelo. Ele inclui as dependências necessárias, como `lottie` para animações e `lucide_icons` para os ícones.

```yaml
name: pubg_verso
description: "Um aplicativo para comparar armas e equipamentos do PUBG."

publish_to: 'none' 

version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  
  lottie: ^3.1.0
  cupertino_icons: ^1.0.8
  lucide_icons: ^0.311.0 # Usar uma versão específica é uma boa prática

dev_dependencies:
  flutter_test:
    sdk: flutter
  
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true

  assets:
    - assets/animations/
    - assets/images/
    - assets/img/avatar/

  # fonts:
  #   - family: Inter
  #     fonts:
  #       - asset: fonts/Inter-Regular.ttf
  #       - asset: fonts/Inter-Bold.ttf
  #         weight: 700
```

---

## Componentes do Design System

Abaixo estão alguns dos principais componentes disponíveis no Design System, com exemplos de como utilizá-los.

### ActionButton

**Descrição:** Botão customizável com diferentes estilos (primário, secundário, destrutivo), tamanhos e suporte para ícones.

**Localização:** `DesignSystem/Components/Buttons/ActionButton/`

**Exemplo de uso:**

```dart
ActionButton.instantiate(
  viewModel: ActionButtonViewModel(
    size: ActionButtonSize.large,
    style: ActionButtonStyle.primary,
    text: 'Entrar',
    onPressed: () {},
  ),
)
```

### AppCard

**Descrição:** Componente de card versátil que pode ser usado para exibir informações, formulários ou conteúdo personalizado.

**Localização:** `DesignSystem/Components/Card/`

**Exemplo de uso:**

```dart
AppCard(
  viewModel: InfoCardViewModel(
    theme: CardTheme.dark,
    imagePath: 'assets/images/ace32.png',
    title: 'ACE32 - AR',
    details: {'Dano': '4.5', 'Tipo': 'Automático'},
    actions: [
      CardAction(viewModel: ActionButtonViewModel(icon: LucideIcons.plus, ...)),
    ],
  ),
)
```

### StyledInputField

**Descrição:** Campo de texto estilizado com suporte a temas (claro/escuro), validação, ícones e campo de senha.

**Localização:** `DesignSystem/Components/InputField/`

**Exemplo de uso:**

```dart
StyledInputField.instantiate(
  viewModel: InputTextViewModel(
    controller: _controller,
    label: 'Login',
    hintText: '@username',
    theme: InputFieldTheme.dark,
  ),
)
```

### UserAvatar

**Descrição:** Avatar de usuário circular que pode exibir uma imagem ou um ícone padrão.

**Localização:** `DesignSystem/Components/Avatar/`

**Exemplo de uso:**

```dart
UserAvatar(
  viewModel: UserAvatarViewModel(
    imagePath: 'assets/img/avatar/user_photo.jpg',
    radius: 50,
  ),
)
```

### ValueComparisonCard

**Descrição:** Card especializado para comparar dois valores lado a lado, ideal para estatísticas de armas.

**Localização:** `DesignSystem/Components/ValueComparisonCard/`

**Exemplo de uso:**

```dart
ValueComparisonCard(
  viewModel: ValueComparisonViewModel(
    theme: ValueCardTheme.dark,
    entry1: ValueEntry(value: '92', label: 'Pontos', color: Colors.greenAccent),
    entry2: ValueEntry(value: '30', label: 'Pontos', color: Colors.redAccent),
    details: ['Mais rápido', 'Dano maior'],
  ),
)
```
