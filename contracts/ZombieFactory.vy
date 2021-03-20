# @version ^0.2.11

DNA_DIGITS: constant(uint256) = 16
DNA_MODULUS: constant(uint256) = 10 ** DNA_DIGITS

struct Zombie:
    name: String[32]
    dna: uint256

zombies: HashMap[uint256, Zombie]

@external
def createZombie(name: String[32], dna: uint256):
    pass
