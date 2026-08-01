# 🎮 Meus-jogos-

> Hub para projetos, protótipos, ideias e documentação de desenvolvimento de jogos.

## Mundo Torajo — ALGORTHOMUS.EXE: O Eco Azul

Protótipo web de terror psicológico, exploração e anomalias digitais inspirado no conceito de Mundo Torajo / Algorithomus. É um projeto de fã, não oficial.

### Executar o protótipo

```bash
npm start
```

Abra `http://localhost:8080`.

| Ação | Computador | Toque |
| --- | --- | --- |
| Movimento | `WASD` ou setas | botões ← e → |
| Interação | `E` | botão E |
| Avançar diálogo | `Enter` ou clique | botão na tela |
| Pausa e opções | `Esc` ou botão PAUSA | botão PAUSA |

O progresso e as opções do protótipo são salvos localmente no navegador. O prólogo conduz o jogador pela cidade de Verade: espelho `0x7` → três Ecos Azuis → Núcleo Azul → Protocolo Espelho. Consulte [`docs/MECANICAS.md`](docs/MECANICAS.md) para detalhes da versão implementada.

## Documentação do projeto

- `ARENA_AI.md` — orientações de desenvolvimento e qualidade.
- `PROJETO.txt` — escopo geral do repositório.
- `GAME_ARCHITECTURE.md` — arquitetura técnica modular.
- `GAMEPLAY_SYSTEMS.md` — sistemas de gameplay planejados.
- `NARRATIVE_FLOW.md` — estrutura e fluxo narrativo.
- `AI_DESIGN.md` — desenho de comportamentos de IA.
- `LEVEL_DESIGN.md` — áreas e progressão de níveis.
- `UI_UX.md` — diretrizes de interface e experiência.
- `AUDIO_DESIGN.md` — sistema e diretrizes de áudio.
- `SAVE_SYSTEM.md` — persistência e checkpoints.
- `ENTITY_DATABASE.md` — modelo de documentação de entidades.

## Organização prevista

```text
src/       código modular
assets/    imagens, áudio e modelos
docs/      mecânicas e documentação complementar
builds/    versões exportadas
notes/     anotações de desenvolvimento
```

## Padrão de commits

`feat:` funcionalidade · `fix:` correção · `docs:` documentação · `refactor:` organização de código · `assets:` recursos gráficos/sonoros · `chore:` manutenção.
