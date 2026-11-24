/*
//======
					Shotgun Ammo
//======
*/
// Incendiary Special Slugs
/datum/ammo/bullet/shotgun/slug/special/incendiary
	name = "shotgun slug, USCM incendiary-magnum load"
	handful_state = "inc_special_slug"
	damage_type = BURN

/datum/ammo/bullet/shotgun/slug/special/incendiary/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_incendiary)
	))

/datum/ammo/bullet/shotgun/slug/special/incendiary/on_hit_mob(mob/M,obj/projectile/P)
	knockback(M, P, 7)
	pushback(M, P, 7)

/datum/ammo/bullet/shotgun/slug/special/incendiary/on_hit_obj(obj/O,obj/projectile/P)
	burst(get_turf(P),P,damage_type)

/datum/ammo/bullet/shotgun/slug/special/incendiary/on_hit_turf(turf/T,obj/projectile/P)
	burst(get_turf(T),P,damage_type)

// Incendiary Special Flechette
/datum/ammo/bullet/shotgun/flechette/special/incendiary
	name = "flechette shell, USCM I-DU type"
	handful_state = "inc_special_dart"
	damage_type = BURN
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/flechette_spread/spcincendiary

/datum/ammo/bullet/shotgun/flechette/special/incendiary/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_incendiary, /datum/element/bullet_trait_penetrating)
	))

/datum/ammo/bullet/shotgun/flechette/special/incendiary/on_hit_mob(mob/M,obj/projectile/P)
	M.AddComponent(/datum/component/status_effect/toxic_buildup, toxic_buildup = 15, toxic_buildup_dissipation = 0.3, max_buildup = 75)
	knockback(M, P, 5)
	if(M.mob_size >= MOB_SIZE_BIG)
		var/mob/living/L = M
		L.apply_armoured_damage(damage*1.3, ARMOR_BULLET, BRUTE, null, penetration) // As bugs don't take toxin damage, this should give it a little more oomf versus them

/datum/ammo/bullet/shotgun/flechette_spread/spcincendiary
	name = "additional I-DU flechette"
	icon_state = "flechette"
	damage_type = BURN
	accuracy_var_low = PROJECTILE_VARIANCE_TIER_5
	accuracy_var_high = PROJECTILE_VARIANCE_TIER_6
	max_range = 14
	damage = 45
	damage_var_low = PROJECTILE_VARIANCE_TIER_10
	damage_var_high = PROJECTILE_VARIANCE_TIER_5
	penetration = ARMOR_PENETRATION_TIER_9
	scatter = SCATTER_AMOUNT_TIER_5

/datum/ammo/bullet/shotgun/flechette_spread/spcincendiary/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY( /datum/element/bullet_trait_incendiary, /datum/element/bullet_trait_penetrating)
	))

/datum/ammo/bullet/shotgun/flechette_spread/spcincendiary/on_hit_mob(mob/M,obj/projectile/P)
	M.AddComponent(/datum/component/status_effect/toxic_buildup, toxic_buildup = 10, toxic_buildup_dissipation = 0.3, max_buildup = 75)
	if(M.mob_size >= MOB_SIZE_BIG)
		var/mob/living/L = M
		L.apply_armoured_damage(damage*1.2, ARMOR_BULLET, BRUTE, null, penetration) // As bugs don't take toxin damage, this should give it a little more oomf versus them

// Incendiary Special Buckshot
/datum/ammo/bullet/shotgun/buckshot/special/incendiary
	name = "buckshot shell, USCM special-hot type"
	handful_state = "inc_special_buck"
	damage_type = BURN
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/spread/spcincendiary

/datum/ammo/bullet/shotgun/buckshot/special/incendiary/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_incendiary)
	))

/datum/ammo/bullet/shotgun/spread/spcincendiary
	name = "additional buckshot, USCM special-hot type"

	accurate_range = 8
	max_range = 8
	damage = 90
	firing_freq_offset = SOUND_FREQ_LOW
	damage_type = BURN

/datum/ammo/bullet/shotgun/spread/spcincendiary/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_incendiary)
	))

/datum/ammo/bullet/shotgun/spread/spcincendiary/on_hit_mob(mob/M,obj/projectile/P)
	knockback(M, P)
