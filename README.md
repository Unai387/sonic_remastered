# Sonic The Hedgehog Remastered

**Autors:** Unai Meneses i Angel Perez
**Institució:** CFGM Sistemes Microinformàtics i Xarxes
**Motor de Desenvolupament:** Godot Engine 4.2
**Llenguatge:** GDScript

---

## 1. Descripció del Projecte
Aquest projecte consisteix en una reconstrucció tècnica del videojoc Sonic The Hedgehog (1991). L'objectiu principal és la implementació d'un sistema de físiques precís basat en els algorismes originals d'acceleració, inèrcia i fricció, integrant-los en un entorn de desenvolupament modern.

## 2. Especificacions Tècniques

### 2.1. Sistema de Físiques i Moviment
- **Cinemàtica del Jugador:** Ús de `CharacterBody2D` per gestionar desplaçaments complexos.
- **Inèrcia i Pendents:** Lògica programada per ajustar la velocitat en funció de la inclinació de la superfície i la direcció del moviment.
- **Coyote Time i Salt a la Paret:** Funcionalitats afegides per millorar la precisió del control i la resposta del personatge.

### 2.2. Gestió d'Entitats i Àrees
- **Sistema de Col·lisions:** Detecció de dany i recol·lecció d'objectes mitjançant nodes `Area2D`.
- **Lògica d'Anells:** Implementation d'un sistema de dispersió física mitjançant `call_deferred` per evitar conflictes en el processament de col·lisions durant el temps d'execució.
- **Càmera Dinàmica:** Control d'enquadrament mitjançant límits definits per polígons, incloent-hi algorismes de suavitzat i efectes de retroalimentació visual (Screen Shake).

### 2.3. Estructura d'Escenes
El projecte segueix un disseny modular, permetent la reutilització de components:
- **Nodes Globals (Singletons):** El `GameManager` centralitza l'estat de la partida, incloent-hi el recompte de vides i la persistència de dades entre nivells.
- **Transicions:** Sistema de portals automatitzat que gestiona el canvi d'escenes i la càrrega de recursos de forma eficient.

## 3. Controls del Sistema
| Acció | Entrada (Keyboard) |
| :--- | :--- |
| Desplaçament Horitzontal | Fletxes Direccionals / A - D |
| Salt / Acció | Barra Espaiadora / Z |
| Pausa de Sistema | Esc |

## 4. Estructura de Directoris
- `/assets`: Recursos binaris, incloent-hi textures, fitxers d'àudio i fonts.
- `/scenes`: Fitxers `.tscn` que contenen la jerarquia de nodes de nivells i entitats.
- `/scripts`: Lògica de programació organitzada per tipus d'objecte.

## 5. Eines Utilitzades
- **Godot Engine:** Motor principal de desenvolupament.
- **Audacity:** Processament i edició de senyals d'àudio.
- **GIMP / Aseprite:** Manipulació d'actius gràfics i optimització de mapes de bits.

---

## 6. Objectius d'Enginyeria
1. **Fidelitat Funcional:** Replicar el comportament mecànic del programari original.
2. **Modularitat:** Dissenyar un sistema d'escenes independent que faciliti l'escalabilitat del projecte.
3. **Optimització:** Garantir un rendiment estable de 60 FPS mitjançant la gestió eficient de nodes i memòria.

---

## 7. Descàrrega i Instal·lació en Windows

El joc compta amb suport natiu per a sistemes operatius Windows gràcies a l'exportació. No necessites tenir Godot Engine instal·lat al teu equip per jugar.

### 1. Descarregar el joc

Pots descarregar l'executable optimitzat per a arquitectura de 64 bits fent clic en el següent enllaç:

https://drive.usercontent.google.com/download?id=1_zMZ0HMmHlAmWTKMvxSDI_r_4UooWHGj&export=download&authuser=0

---

## 8. Descàrrega i Instal·lació en Linux (Ubuntu)

El joc compta amb suport natiu per a sistemes operatius GNU/Linux (provat en Ubuntu 20.04 i 22.04 LTS o superior) gràcies a l'exportació standalone. No necessites tenir Godot Engine instal·lat al teu equip per jugar.

### 1. Descarregar el joc
Pots descarregar l'executable optimitzat per a arquitectura de 64 bits fent clic en el següent enllaç:

https://drive.google.com/file/d/1efrTt8wcKxEPzZNyN-Tlv6naBktyQSom/view?usp=drive_link

### 2. Atorgar permisos d'execució
Per motius de seguretat, Linux bloqueja l'execució de binaris descarregats d'internet de forma predeterminada. Obre una terminal a la carpeta on has desat el fitxer descarregat i assigna-li permisos d'execució amb la següent comanda:

```bash
chmod +x SonicTheHedgehogRemastered.x86_64
./SonicTheHedgehogRemastered.x86_64
