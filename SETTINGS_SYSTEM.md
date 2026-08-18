# SETTINGS_SYSTEM.md

## Objetivo

Este documento define o sistema central de configurações do jogo.

Toda configuração deve ter uma fonte única de verdade, ser aplicada de forma previsível e ser persistida pelo sistema de save quando apropriado.

---

## Princípios

- Configurações devem ser fáceis de entender.
- Alterações devem ter efeito previsível.
- O jogo deve possuir valores padrão seguros.
- Configurações não devem alterar regras fundamentais sem intenção de design.
- UI e sistemas devem consumir o mesmo estado de configuração.

---

## Categorias

### Áudio
- volume geral
- música
- efeitos
- ambiente
- vozes
- interface

### Vídeo
- resolução
- modo de tela
- qualidade gráfica
- sombras
- efeitos
- limite de FPS
- sincronização vertical

### Controles
- sensibilidade
- inversão de eixo
- teclas/botões personalizados
- vibração
- esquema de controle

### Gameplay
- dificuldade
- assistência
- intensidade de efeitos, quando aplicável
- opções de interação

### Acessibilidade
- tamanho de texto
- legendas
- contraste
- redução de movimento
- opções de áudio
- auxílio visual

### Idioma
- idioma da interface
- idioma de legendas
- idioma de voz, quando disponível

---

## Estrutura de dados

Modelo lógico sugerido:

```text
SettingsData
├── Audio
├── Video
├── Controls
├── Gameplay
├── Accessibility
└── Localization
```

---

## Valores padrão

Toda opção precisa de um valor padrão conhecido.

Exemplo:

```text
master_volume = 1.0
music_volume = 0.8
sfx_volume = 1.0
fullscreen = true
language = pt-BR
subtitles = true
```

Os valores são exemplos e devem ser ajustados conforme os testes reais do jogo.

---

## Aplicação das configurações

### Fluxo

1. Carregar valores padrão.
2. Carregar save/configuração local.
3. Validar valores.
4. Aplicar sistemas.
5. Atualizar interface.

### Regras
- Não aplicar valores inválidos.
- Alterações temporárias podem ser testadas antes de confirmar.
- Opções que exigirem reinício devem avisar claramente.

---

## Persistência

Salvar as configurações fora do estado específico do capítulo quando possível.

Exemplos:

- idioma
- volume
- sensibilidade
- acessibilidade
- resolução

Essas opções devem permanecer mesmo quando o jogador iniciar um novo jogo.

---

## Controles

### Requisitos
- remapeamento de teclas/botões
- suporte a teclado e controle quando disponível
- sensibilidade configurável
- inversão de eixo
- vibração configurável

### Regras
- impedir conflito de comandos críticos
- sempre mostrar ação atual
- permitir restaurar padrão

---

## Vídeo

### Requisitos
- resolução suportada
- janela/tela cheia
- qualidade gráfica
- FPS alvo
- VSync

### Regras
- detectar opções incompatíveis
- aplicar alterações sem corromper a configuração
- restaurar último valor válido após falha

---

## Áudio

Cada categoria deve possuir volume independente.

### Regras
- zero significa mudo
- valores fora do intervalo devem ser corrigidos
- alterações devem atualizar o Audio Manager imediatamente, quando possível

---

## Acessibilidade

### Recursos recomendados
- legendas
- tamanho de texto
- contraste reforçado
- redução de efeitos visuais
- redução de movimento de câmera
- opções de áudio por categoria
- assistência visual para interação importante

### Regra
Acessibilidade não deve ser tratada como recurso secundário. Deve ser considerada desde a implementação da UI e do gameplay.

---

## Tela de configurações

### Estrutura sugerida

```text
Configurações
├── Áudio
├── Vídeo
├── Controles
├── Gameplay
├── Acessibilidade
├── Idioma
└── Restaurar padrões
```

### UX
- categorias claras
- descrição curta da opção selecionada
- feedback imediato
- confirmação apenas quando necessário

---

## Restauração de padrões

Deve existir uma ação para restaurar configurações padrão.

### Regras
- pedir confirmação antes de apagar personalizações
- restaurar somente configurações, nunca o save do jogo
- aplicar valores após confirmação

---

## Compatibilidade

Quando uma nova versão adicionar configurações:

1. verificar se a chave existe;
2. se não existir, usar valor padrão;
3. manter as configurações existentes;
4. salvar o novo formato após validação.

Isso evita quebrar configurações antigas.

---

## Organização técnica

Sugestão:

```text
src/systems/settings/
├── settings_manager
├── settings_schema
├── audio_settings
├── video_settings
├── control_settings
├── gameplay_settings
└── accessibility_settings
```

---

## Checklist

Antes de finalizar o sistema:

- Todas as opções têm valor padrão?
- Valores inválidos são tratados?
- Configurações persistem corretamente?
- O reset funciona sem apagar saves?
- UI e sistemas usam a mesma fonte de dados?
- Acessibilidade foi testada?
- Controles podem ser restaurados?

## Regra final

Configuração boa é aquela que o jogador entende, altera e esquece que existe — porque o jogo simplesmente respeita a escolha dele.
