# ITEM_DATABASE.md

## Objetivo

Este documento organiza todos os itens do jogo em uma base clara, modular e fácil de expandir.

A intenção é evitar inventário bagunçado e facilitar a implementação de sistemas como coleta, uso, combinação, missões e progressão.

---

## Filosofia

Cada item precisa existir por um motivo.

Itens podem servir para:

- progressão
- narrativa
- cura
- puzzle
- desbloqueio de áreas
- combate ou defesa
- lore
- comércio, se existir

Se um item não faz nada, ele provavelmente não deveria estar no jogo.

---

## Estrutura de registro

Todo item deve possuir:

- ID
- nome
- tipo
- raridade
- descrição
- função
- onde encontra
- se é consumível
- se é único
- se pode ser combinado
- capítulo em que aparece
- flags relacionadas

---

## Estrutura padrão

```text
ITEM_ID:
NAME:
TYPE:
RARITY:
DESCRIPTION:
FUNCTION:
FOUND_IN:
CONSUMABLE:
UNIQUE:
COMBINABLE:
CHAPTER:
FLAGS:
NOTES:
```

---

## Tipos de item

### 1. Item de missão
Usado para progressão principal ou secundária.

### 2. Item consumível
Usado uma vez, como cura, energia ou recurso temporário.

### 3. Item-chave
Desbloqueia portas, sistemas ou áreas.

### 4. Documento
Serve para lore, pistas e narrativa.

### 5. Item de puzzle
Parte de um mecanismo ou enigma.

### 6. Equipamento
Altera atributos, defesa ou funcionalidade.

### 7. Item especial
Objeto único com função narrativa ou mecânica importante.

---

## Exemplo de ficha

```text
ITEM_ID: ITM_001
NAME: Chave do Laboratório
TYPE: Item-chave
RARITY: Raro
DESCRIPTION: Abre a porta principal do laboratório antigo.
FUNCTION: Desbloquear área fechada
FOUND_IN: Sala de segurança
CONSUMABLE: Não
UNIQUE: Sim
COMBINABLE: Não
CHAPTER: 1
FLAGS: laboratory_key_found
NOTES: necessário para progressão principal
```

---

## Campos de gameplay

### Função
Descrever claramente o que o item faz.

### Regras
- Um item deve ter uso definido.
- Se for consumível, deve indicar o que muda.
- Se for chave, deve indicar o que desbloqueia.
- Se for de puzzle, deve explicar a relação com o enigma.

---

## Campos narrativos

### Descrição
A descrição pode carregar lore, pista ou contexto do mundo.

### Regras
- item importante deve ter texto útil
- documentos precisam trazer informação real
- itens especiais podem contar parte da história

---

## Campos de progressão

### Onde encontra
Registrar o local de obtenção ajuda no design de fases e balanceamento.

### Regras
- item principal não pode ficar escondido sem pista
- item opcional pode recompensar exploração
- item único deve ser controlado por flag

---

## Estado dos itens

### Estados possíveis
- coletado
- usado
- equipado
- descartado
- perdido por evento
- disponível

### Regras
- o sistema deve saber se o item ainda existe
- itens únicos não podem duplicar
- itens consumíveis devem sair do inventário após uso

---

## Categorias úteis para UI

### Organização recomendada
- missão
- chave
- consumível
- documento
- equipamento
- puzzle
- especial

### Regras
- categorias ajudam navegação
- item de história não deve se misturar com junk
- descrição deve aparecer ao selecionar o item

---

## Sistema de combinação

Alguns itens podem se combinar para criar outro.

### Exemplos
- peça + peça
- cabo + fusível
- frasco + substância
- documento + código

### Regras
- combinação precisa ser documentada
- resultado deve ser previsível
- itens combinados precisam registrar nova flag ou novo item

---

## Organização por capítulos

### Exemplo de progressão
- capítulo 1: itens básicos e chaves simples
- capítulo 2: itens de puzzle e consumíveis melhores
- capítulo 3: itens narrativos e especiais
- capítulo 4: itens críticos para conclusão

### Regra
Cada capítulo precisa apresentar algo novo ou aprofundar um sistema já existente.

---

## Balanceamento

### O que revisar
- quantidade de itens no mapa
- frequência de cura
- número de chaves
- impacto de itens especiais
- utilidade de itens opcionais

### Regra
Item demais tira tensão. Item de menos vira sofrimento sem recompensa.

---

## Organização de arquivos

### Sugestão
- `items/key_items/`
- `items/consumables/`
- `items/documents/`
- `items/puzzle/`
- `items/special/`
- `items/equipment/`

### Para cada item importante
Criar ao menos:
- ficha técnica
- efeito
- localização
- relação com capítulo

---

## Checklist antes de adicionar um item

- O item tem função clara?
- Ele ajuda a progressão, lore ou gameplay?
- Existe flag se for único?
- O inventário sabe lidar com ele?
- O jogador entende por que pegou esse item?
- Ele está documentado?

---

## Regra final

Se o item não puder ser descrito em uma frase útil, ele provavelmente é só peso morto de inventário.
