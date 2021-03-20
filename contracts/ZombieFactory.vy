# @version ^0.2.11

DNA_DIGITS: constant(uint256) = 16
DNA_MODULUS: constant(uint256) = 10 ** DNA_DIGITS

struct Zombie:
    name: String[32]
    dna: uint256

zombieIndex: uint256
zombies: HashMap[uint256, Zombie]

event NewZombie:
    zombieId: uint256
    name: String[32]
    dna: uint256

@internal
def _createZombie(_name: String[32], _dna: uint256):
    self.zombies[self.zombieIndex] = Zombie({
        name: _name,
        dna: _dna
    })
    self.zombieIndex += 1

    log NewZombie(self.zombieIndex - 1, _name, _dna)

@view
@internal
def _generateRandomDna(_str: String[32]) -> uint256:
    rand: uint256 = convert(keccak256(_str), uint256)
    return rand % DNA_MODULUS

@external
def createRandomZombie(name: String[32]):
    randDna: uint256 = self._generateRandomDna(name)
    self._createZombie(name, randDna)
