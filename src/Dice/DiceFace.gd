# used for getting a dice face from const

enum DiceType {
	ATTACK_DICE,
}

func getDiceFace(diceType):
	match diceType:
		DiceType.ATTACK_DICE:
			pass
