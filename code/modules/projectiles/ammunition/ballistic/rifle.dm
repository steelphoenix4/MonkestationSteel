// 7.62 (Nagant Rifle)

/obj/item/ammo_casing/a762
	name = "7.62 bullet casing"
	desc = "A 7.62 bullet casing."
	icon_state = "762-casing"
	caliber = CALIBER_A762
	projectile_type = /obj/projectile/bullet/a762

/obj/item/ammo_casing/a762/surplus
	name = "7.62 surplus bullet casing"
	desc = "A surplus 7.62 bullet casing."
	projectile_type = /obj/projectile/bullet/a762/surplus

/obj/item/ammo_casing/a762/enchanted
	projectile_type = /obj/projectile/bullet/a762/enchanted

// 5.56mm (M-90gl Carbine)

/obj/item/ammo_casing/a556
	name = "5.56mm bullet casing"
	desc = "A 5.56mm bullet casing."
	caliber = CALIBER_A556
	projectile_type = /obj/projectile/bullet/a556

/obj/item/ammo_casing/a556/phasic
	name = "5.56mm phasic bullet casing"
	desc = "A 5.56mm phasic bullet casing."
	projectile_type = /obj/projectile/bullet/a556/phasic

/obj/item/ammo_casing/a556/weak
	projectile_type = /obj/projectile/bullet/a556/weak

// 40mm (Grenade Launcher)
//MONKESTATION REMOVAL: moved to 40mm_grenade.dm
// /obj/item/ammo_casing/a40mm
// 	name = "40mm HE shell"
// 	desc = "A cased high explosive grenade that can only be activated once fired out of a grenade launcher."
// 	caliber = CALIBER_40MM
// 	icon_state = "40mmHE"
// 	projectile_type = /obj/projectile/bullet/a40mm

/obj/item/ammo_casing/rebar
	name = "Sharpened Iron Rod"
	desc = "A Sharpened Iron rod. It's Pointy!"
	caliber = CALIBER_REBAR
	icon_state = "rod_sharp"
	base_icon_state = "rod_sharp"
	projectile_type = /obj/projectile/bullet/rebar

/obj/item/ammo_casing/rebar/syndie
	name = "Jagged Iron Rod"
	desc = "An Iron rod, with notches cut into it. You really don't want this stuck in you."
	caliber = CALIBER_REBAR
	icon_state = "rod_jagged"
	base_icon_state = "rod_jagged"
	projectile_type = /obj/projectile/bullet/rebar/syndie

/obj/item/ammo_casing/rebar/zaukerite
	name = "Zaukerite Sliver"
	desc = "A sliver of a zaukerite crystal. Due to its irregular, jagged edges, removal of an embedded zaukerite sliver should only be done by trained surgeons."
	caliber = CALIBER_REBAR
	icon_state = "rod_zaukerite"
	base_icon_state = "rod_zaukerite"
	projectile_type = /obj/projectile/bullet/rebar/zaukerite

/obj/item/ammo_casing/rebar/hydrogen
	name = "Metallic Hydrogen Bolt"
	desc = "An ultra-sharp rod made from pure metallic hydrogen. Armor may as well not exist."
	caliber = CALIBER_REBAR
	icon_state = "rod_hydrogen"
	base_icon_state = "rod_hydrogen"
	projectile_type = /obj/projectile/bullet/rebar/hydrogen

/obj/item/ammo_casing/rebar/healium
	name = "Healium Crystal Bolt"
	desc = "Who needs a syringe gun, anyway?"
	caliber = CALIBER_REBAR
	icon_state = "rod_healium"
	base_icon_state =  "rod_healium"
	projectile_type = /obj/projectile/bullet/rebar/healium

/obj/item/ammo_casing/rebar/supermatter
	name = "Supermatter Bolt"
	desc = "Wait, how is the bow capable of firing this without dusting?"
	caliber = CALIBER_REBAR
	icon_state = "rod_supermatter"
	base_icon_state = "rod_supermatter"
	projectile_type = /obj/projectile/bullet/rebar/supermatter

/obj/item/ammo_casing/rebar/paperball
	name = "Paper Ball"
	desc = "Doink!"
	caliber = CALIBER_REBAR
	icon_state = "paperball"
	base_icon_state = "paperball"
	projectile_type = /obj/projectile/bullet/paperball

/obj/item/ammo_casing/rebar/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/caseless, TRUE)

/obj/item/ammo_casing/rebar/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]"

/obj/item/ammo_casing/a223
	name = ".223 bullet casing"
	desc = "A .223 bullet casing."
	caliber = CALIBER_A223
	projectile_type = /obj/projectile/bullet/a223

/obj/item/ammo_casing/a223/phasic
	name = ".223 phasic bullet casing"
	desc = "A .223 phasic bullet casing."
	projectile_type = /obj/projectile/bullet/a223/phasic

/obj/item/ammo_casing/a223/weak
	projectile_type = /obj/projectile/bullet/a223/weak
