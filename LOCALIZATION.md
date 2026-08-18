# LOCALIZATION.md

## Objetivo

Este documento define como o jogo deve tratar múltiplos idiomas.

A localização deve ser planejada desde o começo para evitar textos presos ao código e retrabalho de interface.

---

## Idioma base

O projeto deve possuir um idioma fonte oficial para desenvolvimento.

```text
Base: pt-BR
```

Novos idiomas devem ser adicionados a partir das chaves do idioma base, nunca duplicando lógica de gameplay.

---

## Princípios

- Nunca colocar texto narrativo diretamente na lógica principal.
- Usar chaves de localização.
- Permitir textos maiores sem quebrar a UI.
- Não depender de gênero, plural ou comprimento fixo quando não for necessário.
- Registrar traduções incompletas sem bloquear o desenvolvimento.

---

## Estrutura de chaves

As chaves devem ser estáveis e descritivas.

Exemplos:

```text
menu.start
menu.options
menu.quit
hud.health
hud.sanity
interaction.open
interaction.locked
chapter.01.title
chapter.01.objective.main
entity.shadow.name
```

### Regras
- Não renomear uma chave sem revisar todas as referências.
- Evitar chaves genéricas como `text_01`.
- Usar agrupamento por sistema ou conteúdo.

---

## Categorias

### UI
- menus
- HUD
- inventário
- configurações
- avisos

### Narrativa
- capítulos
- diálogos
- documentos
- cutscenes
- objetivos

### Gameplay
- interações
- itens
- puzzles
- mensagens de sistema

### Entidades
- nomes
- descrições
- mensagens específicas

---

## Arquivos de idioma

Estrutura sugerida:

```text
localization/
├── pt-BR/
│   ├── ui.json
│   ├── narrative.json
│   ├── gameplay.json
│   └── entities.json
├── en-US/
│   ├── ui.json
│   ├── narrative.json
│   ├── gameplay.json
│   └── entities.json
└── es-ES/
    ├── ui.json
    ├── narrative.json
    ├── gameplay.json
    └── entities.json
```

O formato pode mudar conforme a engine, mas o princípio permanece: dados de tradução ficam separados da lógica.

---

## Variáveis em texto

Mensagens podem receber parâmetros.

Exemplo:

```text
objective.items_found = "Itens encontrados: {current}/{total}"
```

### Regras
- nomes dos parâmetros devem ser consistentes
- parâmetros ausentes devem gerar erro visível em desenvolvimento
- não montar frases inteiras por concatenação quando a tradução puder mudar a ordem das palavras

---

## Plural e gênero

Quando necessário, usar suporte específico da ferramenta de localização.

Exemplo conceitual:

```text
items.count.one
items.count.other
```

Não assumir que uma estrutura de plural do português será válida em todos os idiomas.

---

## Diálogos

Cada linha de diálogo deve possuir:

- ID
- personagem
- texto base
- tradução
- contexto
- capítulo
- evento de origem

### Regra
O sistema de diálogo nunca deve depender do texto para controlar gameplay.
Eventos e flags continuam usando IDs técnicos.

---

## Documentos e lore

Documentos precisam estar totalmente localizáveis.

### Regras
- separar título e corpo
- preservar formatação quando necessário
- não colocar código técnico dentro de texto traduzível sem necessidade
- pistas que dependem de idioma precisam ser revisadas por idioma

---

## UI e expansão de texto

Traduções podem ficar maiores ou menores que o texto original.

### A interface deve:
- permitir expansão horizontal e vertical
- evitar campos com tamanho rígido para frases longas
- suportar quebra automática
- manter botões legíveis

---

## Fontes

O sistema deve prever que alguns idiomas podem precisar de caracteres diferentes.

### Regras
- escolher fontes com suporte suficiente
- testar acentos
- testar caracteres especiais
- evitar fonte que falhe silenciosamente

---

## Idioma das vozes

Se houver dublagem:

- áudio precisa possuir ID próprio
- texto e áudio devem ser ligados pelo mesmo identificador lógico
- falha de uma voz não pode quebrar o diálogo

Exemplo:

```text
dialogue_0042.text

dialogue_0042.voice.pt-BR

dialogue_0042.voice.en-US
```

---

## Fallback

Quando uma tradução não existir:

```text
Idioma escolhido
        ↓
Tradução disponível?
   ├── Sim → usar tradução
   └── Não → usar idioma base
```

### Regras
- nunca mostrar chave técnica ao jogador em produção
- registrar tradução ausente em log de desenvolvimento

---

## Troca de idioma

O jogador deve poder selecionar o idioma nas configurações.

### Regras
- idioma deve ser salvo
- alterações devem ser aplicadas sem reiniciar quando possível
- diálogos e UI abertas devem atualizar de forma segura

---

## QA de localização

Testar:

- texto cortado
- botão estourando layout
- caracteres inválidos
- tradução ausente
- parâmetro ausente
- ordem gramatical incorreta
- quebra de linha ruim
- legenda fora da tela

---

## Integração com a narrativa

A localização nunca pode alterar flags, IDs ou lógica.

Exemplo:

```text
EVT_0042
chapter_02_started
boss_01_defeated
```

Esses identificadores continuam iguais em todos os idiomas.

---

## Checklist

Antes de adicionar um idioma:

- Todas as chaves existem?
- Os parâmetros estão corretos?
- A UI suporta o comprimento dos textos?
- As fontes suportam os caracteres?
- As legendas foram testadas?
- Os documentos continuam legíveis?
- Nenhuma chave técnica aparece para o jogador?

---

## Regra final

Localização não deve ser um trabalho de última hora.

O jogo deve nascer preparado para tradução, mesmo que o lançamento inicial tenha apenas um idioma.
