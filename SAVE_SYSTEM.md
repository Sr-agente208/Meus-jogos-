# SAVE_SYSTEM.md

## Sistema de Save

### Objetivo
Este documento define como o sistema de salvamento deve funcionar.

O principal objetivo é garantir que o progresso do jogador seja preservado com segurança, permitindo futuras expansões sem quebrar saves antigos.

---

## Filosofia

O sistema de save deve ser:

- seguro
- modular
- independente
- versionado
- fácil de expandir
- resistente à corrupção de dados

Nenhum sistema deve salvar informações diretamente sem passar pelo gerenciador de save.

---

## Arquitetura

Todos os sistemas enviam seus dados para um único componente responsável pelo salvamento.

```text
Jogador
      │
Inventário
      │
Eventos
      │
Mundo
      │
Bosses
      │
Puzzles
      │
──────────────
 Save Manager
──────────────
      │
Arquivo de Save
```

---

## Informações que devem ser salvas

### Jogador
- posição
- rotação
- vida
- sanidade
- stamina
- status negativos
- capítulo atual

### Inventário
- todos os itens
- quantidade
- estado do item
- equipamentos ativos
- documentos encontrados

### Mundo
- portas abertas
- portas fechadas
- áreas desbloqueadas
- objetos destruídos
- objetos coletados
- interruptores ativados
- elevadores
- energia ligada/desligada

### Eventos
Salvar todas as flags.

Exemplos:
- tutorial_finished
- first_entity_seen
- laboratory_open
- generator_enabled
- boss_01_dead
- ending_unlocked

### Bosses
Cada boss deve registrar:
- derrotado
- fase alcançada
- eventos liberados

### Inimigos
Registrar apenas os necessários.

Exemplos:
- entidades únicas
- inimigos importantes
- NPCs especiais

Inimigos comuns podem reaparecer conforme a lógica do jogo.

### Puzzles
Salvar:
- resolvido
- progresso parcial
- combinação correta
- peças utilizadas

### Cutscenes
Registrar:
- assistida
- ignorada
- disponível para replay

### Configurações
Salvar:
- idioma
- volume
- brilho
- sensibilidade
- acessibilidade
- controles personalizados

---

## Slots

O sistema deve suportar:

- Slot 1
- Slot 2
- Slot 3

Além de:

- Auto Save

---

## Auto Save

Salvar automaticamente quando:

- capítulo inicia
- capítulo termina
- boss derrotado
- puzzle importante resolvido
- grande evento narrativo acontece

Nunca salvar durante:

- perseguições
- combate
- animações críticas
- transições incompletas

---

## Checkpoints

Cada checkpoint deve possuir:

- ID
- localização
- capítulo
- descrição

Exemplo:

CHECKPOINT_01

Laboratório

Capítulo 1

---

## Estrutura sugerida do Save

```text
SaveData

Player
Inventory
World
Events
Bosses
Puzzles
Documents
Settings
Statistics
```

---

## Estatísticas

Também salvar:

- tempo jogado
- mortes
- perseguições sobrevividas
- puzzles resolvidos
- documentos encontrados
- finais desbloqueados

---

## Versionamento

Todo save deve possuir:

- versão
- data
- hora

Exemplo:

Version: 1.0.0

Caso o formato mude, o jogo poderá converter saves antigos quando possível.

---

## Integridade

Antes de carregar:

- verificar existência
- validar estrutura
- validar versão
- verificar dados obrigatórios

Caso haja erro:

- avisar o jogador
- impedir corrupção em cascata
- tentar restaurar backup

---

## Backup

Recomendado manter:

- Save Principal
- Backup Automático

Sempre substituir o backup somente após um save válido.

---

## Fluxo de Save

1. Solicitação de salvar.
2. Coleta dos dados dos sistemas.
3. Validação.
4. Escrita no arquivo.
5. Verificação de sucesso.
6. Atualização do backup.

---

## Regras

- Nunca salvar dados duplicados.
- Nunca depender da interface.
- Nunca misturar lógica de save com gameplay.
- Sistemas devem apenas fornecer dados.
- O Save Manager é o único responsável pela escrita.

---

## Checklist

Antes de finalizar o sistema:

- O jogador volta exatamente ao estado salvo?
- Inventário permanece correto?
- Eventos continuam funcionando?
- Bosses mantêm o estado?
- Portas permanecem corretas?
- Save antigo continua compatível?

Se todas as respostas forem "sim", o sistema está pronto.
