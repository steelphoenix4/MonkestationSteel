/atom/movable/screen/human
	icon = 'icons/hud/screen_midnight.dmi'

/atom/movable/screen/human/toggle
	name = "toggle"
	icon_state = "toggle"
	mouse_over_pointer = MOUSE_HAND_POINTER

/atom/movable/screen/human/toggle/Click()

	var/mob/targetmob = usr

	if(isobserver(usr))
		if(ishuman(usr.client.eye) && (usr.client.eye != usr))
			var/mob/M = usr.client.eye
			targetmob = M

	if(usr.hud_used.inventory_shown && targetmob.hud_used)
		usr.hud_used.inventory_shown = FALSE
		usr.client.screen -= targetmob.hud_used.toggleable_inventory
	else
		usr.hud_used.inventory_shown = TRUE
		usr.client.screen += targetmob.hud_used.toggleable_inventory

	targetmob.hud_used.hidden_inventory_update(usr)

/atom/movable/screen/human/equip
	name = "equip"
	icon_state = "act_equip"
	mouse_over_pointer = MOUSE_HAND_POINTER

/atom/movable/screen/human/equip/Click()
	if(ismecha(usr.loc)) // stops inventory actions in a mech
		return TRUE
	var/mob/living/carbon/human/H = usr
	H.quick_equip()

/atom/movable/screen/ling
	icon = 'icons/hud/screen_changeling.dmi'

/atom/movable/screen/ling/chems
	name = "chemical storage"
	icon_state = "power_display"
	screen_loc = ui_lingchemdisplay

/atom/movable/screen/ling/sting
	name = "current sting"
	screen_loc = ui_lingstingdisplay
	invisibility = INVISIBILITY_ABSTRACT
	mouse_over_pointer = MOUSE_HAND_POINTER

/atom/movable/screen/ling/sting/Click()
	if(isobserver(usr))
		return
	var/mob/living/carbon/carbon_user = usr
	carbon_user.unset_sting()

/datum/hud/human
	has_interaction_ui = TRUE

/datum/hud/human/New(mob/living/carbon/human/owner)
	..()

	var/atom/movable/screen/using
	var/atom/movable/screen/inventory/inv_box

	using = new /atom/movable/screen/language_menu(null, src)
	using.icon = ui_style
	static_inventory += using

	using = new /atom/movable/screen/navigate(null, src)
	using.icon = ui_style
	static_inventory += using

	using = new /atom/movable/screen/area_creator(null, src)
	using.icon = ui_style
	static_inventory += using

	using = new /atom/movable/screen/mov_intent(null, src)
	using.icon = ui_style
	using.icon_state = (mymob.m_intent == MOVE_INTENT_WALK ? "walking" : "running")
	using.screen_loc = ui_movi
	static_inventory += using

	using = new /atom/movable/screen/drop(null, src)
	using.icon = ui_style
	using.screen_loc = ui_drop_throw
	static_inventory += using

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "uniform"
	inv_box.icon = ui_style
	inv_box.slot_id = ITEM_SLOT_ICLOTHING
	inv_box.icon_state = "uniform"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_iclothing
	toggleable_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "suit"
	inv_box.icon = ui_style
	inv_box.slot_id = ITEM_SLOT_OCLOTHING
	inv_box.icon_state = "suit"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_oclothing
	toggleable_inventory += inv_box

	build_hand_slots()

	using = new /atom/movable/screen/swap_hand(null, src)
	using.icon = ui_style
	using.icon_state = "swap_1"
	using.screen_loc = ui_swaphand_position(owner,1)
	static_inventory += using

	using = new /atom/movable/screen/swap_hand(null, src)
	using.icon = ui_style
	using.icon_state = "swap_2"
	using.screen_loc = ui_swaphand_position(owner,2)
	static_inventory += using

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "id"
	inv_box.icon = ui_style
	inv_box.icon_state = "id"
	inv_box.icon_full = "template_small"
	inv_box.screen_loc = ui_id
	inv_box.slot_id = ITEM_SLOT_ID
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "mask"
	inv_box.icon = ui_style
	inv_box.icon_state = "mask"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_mask
	inv_box.slot_id = ITEM_SLOT_MASK
	toggleable_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "neck"
	inv_box.icon = ui_style
	inv_box.icon_state = "neck"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_neck
	inv_box.slot_id = ITEM_SLOT_NECK
	toggleable_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "back"
	inv_box.icon = ui_style
	inv_box.icon_state = "back"
	inv_box.icon_full = "template_small"
	inv_box.screen_loc = ui_back
	inv_box.slot_id = ITEM_SLOT_BACK
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "left pocket"
	inv_box.icon = ui_style
	inv_box.icon_state = "pocket"
	inv_box.icon_full = "template_small"
	inv_box.screen_loc = ui_storage1
	inv_box.slot_id = ITEM_SLOT_LPOCKET
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "right pocket"
	inv_box.icon = ui_style
	inv_box.icon_state = "pocket"
	inv_box.icon_full = "template_small"
	inv_box.screen_loc = ui_storage2
	inv_box.slot_id = ITEM_SLOT_RPOCKET
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "suit storage"
	inv_box.icon = ui_style
	inv_box.icon_state = "suit_storage"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_sstore1
	inv_box.slot_id = ITEM_SLOT_SUITSTORE
	static_inventory += inv_box

	using = new /atom/movable/screen/resist(null, src)
	using.icon = ui_style
	using.screen_loc = ui_above_intent
	hotkeybuttons += using

	using = new /atom/movable/screen/human/toggle(null, src)
	using.icon = ui_style
	using.screen_loc = ui_inventory
	static_inventory += using

	using = new /atom/movable/screen/human/equip(null, src)
	using.icon = ui_style
	using.screen_loc = ui_equip_position(mymob)
	static_inventory += using

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "gloves"
	inv_box.icon = ui_style
	inv_box.icon_state = "gloves"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_gloves
	inv_box.slot_id = ITEM_SLOT_GLOVES
	toggleable_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "eyes"
	inv_box.icon = ui_style
	inv_box.icon_state = "glasses"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_glasses
	inv_box.slot_id = ITEM_SLOT_EYES
	toggleable_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "ears"
	inv_box.icon = ui_style
	inv_box.icon_state = "ears"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_ears
	inv_box.slot_id = ITEM_SLOT_EARS
	toggleable_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "head"
	inv_box.icon = ui_style
	inv_box.icon_state = "head"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_head
	inv_box.slot_id = ITEM_SLOT_HEAD
	toggleable_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "shoes"
	inv_box.icon = ui_style
	inv_box.icon_state = "shoes"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_shoes
	inv_box.slot_id = ITEM_SLOT_FEET
	toggleable_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "belt"
	inv_box.icon = ui_style
	inv_box.icon_state = "belt"
	inv_box.icon_full = "template_small"
	inv_box.screen_loc = ui_belt
	inv_box.slot_id = ITEM_SLOT_BELT
	static_inventory += inv_box

	throw_icon = new /atom/movable/screen/throw_catch(null, src)
	throw_icon.icon = ui_style
	throw_icon.screen_loc = ui_drop_throw
	hotkeybuttons += throw_icon

	rest_icon = new /atom/movable/screen/rest(null, src)
	rest_icon.icon = ui_style
	rest_icon.screen_loc = ui_above_movement
	rest_icon.update_appearance()
	static_inventory += rest_icon

	spacesuit = new /atom/movable/screen/spacesuit(null, src)
	infodisplay += spacesuit

	healths = new /atom/movable/screen/healths(null, src)
	infodisplay += healths

	hunger = new /atom/movable/screen/hunger(null, src)
	infodisplay += hunger

	healthdoll = new /atom/movable/screen/healthdoll/human(null, src)
	infodisplay += healthdoll

	stamina = new /atom/movable/screen/stamina(null, src)
	infodisplay += stamina

	pull_icon = new /atom/movable/screen/pull(null, src)
	pull_icon.icon = ui_style
	pull_icon.screen_loc = ui_above_intent
	pull_icon.update_appearance()
	static_inventory += pull_icon

	zone_select = new /atom/movable/screen/zone_sel(null, src)
	zone_select.icon = ui_style
	zone_select.update_appearance()
	static_inventory += zone_select

	combo_display = new /atom/movable/screen/combo(null, src)
	infodisplay += combo_display

	for(var/atom/movable/screen/inventory/inv in (static_inventory + toggleable_inventory))
		if(inv.slot_id)
			inv_slots[TOBITSHIFT(inv.slot_id) + 1] = inv
			inv.update_appearance()

	update_locked_slots()

/datum/hud/human/update_locked_slots()
	if(!mymob)
		return
	var/mob/living/carbon/human/H = mymob
	if(!istype(H) || !H.dna.species)
		return
	var/datum/species/S = H.dna.species
	for(var/atom/movable/screen/inventory/inv in (static_inventory + toggleable_inventory))
		if(inv.slot_id)
			if(S.no_equip_flags & inv.slot_id)
				inv.alpha = 128
			else
				inv.alpha = initial(inv.alpha)

/datum/hud/human/hidden_inventory_update(mob/viewer)
	if(!mymob)
		return
	var/mob/living/carbon/human/H = mymob

	var/mob/screenmob = viewer || H

	if(screenmob.hud_used.inventory_shown && screenmob.hud_used.hud_shown)
		if(H.shoes)
			H.shoes.screen_loc = ui_shoes
			screenmob.client.screen += H.shoes
		if(H.gloves)
			H.gloves.screen_loc = ui_gloves
			screenmob.client.screen += H.gloves
		if(H.ears)
			H.ears.screen_loc = ui_ears
			screenmob.client.screen += H.ears
		if(H.glasses)
			H.glasses.screen_loc = ui_glasses
			screenmob.client.screen += H.glasses
		if(H.w_uniform)
			H.w_uniform.screen_loc = ui_iclothing
			screenmob.client.screen += H.w_uniform
		if(H.wear_suit)
			H.wear_suit.screen_loc = ui_oclothing
			screenmob.client.screen += H.wear_suit
		if(H.wear_mask)
			H.wear_mask.screen_loc = ui_mask
			screenmob.client.screen += H.wear_mask
		if(H.wear_neck)
			H.wear_neck.screen_loc = ui_neck
			screenmob.client.screen += H.wear_neck
		if(H.head)
			H.head.screen_loc = ui_head
			screenmob.client.screen += H.head
	else
		if(H.shoes)
			screenmob.client.screen -= H.shoes
		if(H.gloves)
			screenmob.client.screen -= H.gloves
		if(H.ears)
			screenmob.client.screen -= H.ears
		if(H.glasses)
			screenmob.client.screen -= H.glasses
		if(H.w_uniform)
			screenmob.client.screen -= H.w_uniform
		if(H.wear_suit)
			screenmob.client.screen -= H.wear_suit
		if(H.wear_mask)
			screenmob.client.screen -= H.wear_mask
		if(H.wear_neck)
			screenmob.client.screen -= H.wear_neck
		if(H.head)
			screenmob.client.screen -= H.head



/datum/hud/human/persistent_inventory_update(mob/viewer)
	if(!mymob)
		return
	..()
	var/mob/living/carbon/human/H = mymob

	var/mob/screenmob = viewer || H

	if(screenmob.hud_used)
		if(screenmob.hud_used.hud_shown)
			if(H.s_store)
				H.s_store.screen_loc = ui_sstore1
				screenmob.client.screen += H.s_store
			if(H.wear_id)
				H.wear_id.screen_loc = ui_id
				screenmob.client.screen += H.wear_id
			if(H.belt)
				H.belt.screen_loc = ui_belt
				screenmob.client.screen += H.belt
			if(H.back)
				H.back.screen_loc = ui_back
				screenmob.client.screen += H.back
			if(H.l_store)
				H.l_store.screen_loc = ui_storage1
				screenmob.client.screen += H.l_store
			if(H.r_store)
				H.r_store.screen_loc = ui_storage2
				screenmob.client.screen += H.r_store
		else
			if(H.s_store)
				screenmob.client.screen -= H.s_store
			if(H.wear_id)
				screenmob.client.screen -= H.wear_id
			if(H.belt)
				screenmob.client.screen -= H.belt
			if(H.back)
				screenmob.client.screen -= H.back
			if(H.l_store)
				screenmob.client.screen -= H.l_store
			if(H.r_store)
				screenmob.client.screen -= H.r_store

	if(hud_version != HUD_STYLE_NOHUD)
		for(var/obj/item/I in H.held_items)
			I.screen_loc = ui_hand_position(H.get_held_index_of_item(I))
			screenmob.client.screen += I
	else
		for(var/obj/item/I in H.held_items)
			I.screen_loc = null
			screenmob.client.screen -= I


/mob/living/carbon/human/verb/toggle_hotkey_verbs()
	set category = "OOC"
	set name = "Toggle hotkey buttons"
	set desc = "This disables or enables the user interface buttons which can be used with hotkeys."

	if(hud_used.hotkey_ui_hidden)
		client.screen += hud_used.hotkeybuttons
		hud_used.hotkey_ui_hidden = FALSE
	else
		client.screen -= hud_used.hotkeybuttons
		hud_used.hotkey_ui_hidden = TRUE
