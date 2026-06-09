# Palworld Arena Macro - User Guide

## Requirements

* AutoHotkey v1.1.37 or later.
* Coordinates properly configured for your screen resolution.
* Default in-game keybinds:

  * Arena interaction: **E**
  * Weapon reload: **R**
  * Fire weapon: **Left Mouse Button**

## Initial Setup

1. Position your character **with their back facing the arena**, between the Pokédex pillar and the vendor pillar.
2. Make sure your desired weapon is already selected before starting the macro.
3. Configure the reference coordinates and colors in the script. The coordinates provided were calibrated on a different machine and may not work on your setup.
4. Use AutoHotkey's **Window Spy** to locate the required coordinates and pixel colors.
5. Only use the coordinates shown under **Mouse Position > Screen**. Ignore the **Window** and **Client** values.
6. Run the game in **Windowed Mode**.
7. **F1** starts and **F2** ends the macro.

## Combat Recommendations

* Use a **Guided Rocket Launcher**, as the macro does not perform any manual aiming during the arena.
* If possible, use the **4-shot version (Multishot guided)**, as it provides higher overall damage.
* The script automatically reloads the weapon before each run.
* During the arena, your challengers will be responsible for most of the damage.
* Your character will remain stationary and only perform automatic attacks.
* Use challengers with **high burst-damage builds** to reduce battle duration.

## Recommended Teams

Master Arena (Level 65):

* 3x Hartalis
* 3x Jetdragon (Meteorain)
* Or any team consisting of three 4-star challengers with strong damage-dealing skills.

## Notes

* If a battle is lost, the script will continue running normally.
* If battles are taking too long or you are experiencing frequent defeats, consider running **Diamond** difficulty instead of **Master**, remember to adjust the coordinates when you make the change.
* The faster your challengers eliminate enemies, the more efficient the farming process will be.
* If the script stops working correctly, the first thing to check is whether your coordinates and pixel colors have been calibrated properly.
* **Pay special attention when** configuring the coordinates for the white **TP eagle icon** on the compass at the top of the screen. Since the icon occupies only a few pixels, the coordinate must be extremely accurate. When using Window Spy, try to place the cursor as close as possible to the center of the eagle icon to get the correct coord.
