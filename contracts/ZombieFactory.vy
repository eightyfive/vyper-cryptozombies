# @version ^0.2.11

DNA_DIGITS: constant(uint256) = 16
DNA_MODULUS: constant(uint256) = 10 ** DNA_DIGITS

struct Zombie:
    name: String[32]
    dna: uint256

zombieIndex: uint256
zombies: HashMap[uint256, Zombie]

@internal
def _createZombie(_name: String[32], _dna: uint256):
    self.zombies[self.zombieIndex] = Zombie({
        name: _name,
        dna: _dna
    })
    self.zombieIndex += 1

@view
@internal
def _generateRandomDna(_str: String[32]) -> uint256:
    pass
