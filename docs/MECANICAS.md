# Algorthomus.EXE — Mecânicas do protótipo

## Loop de exploração

1. O jogador explora a cidade de Verade usando teclado ou controles de toque.
2. O espelho `0x7` introduz a anomalia e revela três ecos azuis.
3. Cada eco absorvido aumenta a corrupção (C.O.R.) e altera a leitura do HUD.
4. Depois de reunir os três ecos, o Núcleo Azul se materializa.
5. A interação com o Núcleo conclui o prólogo e exibe o gancho para `ZERAL_//`.

## Controles

| Plataforma | Movimento | Interação / diálogo |
| --- | --- | --- |
| Computador | `WASD` ou setas | `E`; `Enter` ou clique para continuar texto |
| Dispositivo de toque | botões na tela | botão `E` e botões de diálogo |

## Sistemas implementados

- **C.O.R.**: indicador de corrupção atualizado por eventos da narrativa.
- **BPM**: representação visual de tensão vinculada à corrupção.
- **Ecos**: colecionáveis necessários para liberar o Núcleo Azul.
- **Documento / inventário**: o Registro `DOC_001 · SJM-07` é coletável, fica acessível por **PAUSA → ARQUIVOS / INVENTÁRIO** e oferece uma pista de lore ligada ao Protocolo Espelho. O estado do documento é persistido no save.
- **Eventos de interface**: mensagens aleatórias do sistema e efeitos glitch.
- **Final ramificado**: aceitar ou recusar o Protocolo Espelho altera a mensagem final.
- **Pausa e configurações**: `Esc` ou o botão PAUSA abre o menu para continuar, ajustar brilho/volume, salvar ou apagar o save local.
- **Save versionado**: marcos narrativos, Ecos, posição, corrupção e preferências são salvos no `localStorage` do navegador por `src/systems/saveManager.js`. O jogo recupera uma sessão compatível ao iniciar.

O protótipo não envia nem grava informações fora do navegador, não usa microfone e não manipula arquivos ou configurações do dispositivo.
