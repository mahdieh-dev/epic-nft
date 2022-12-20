// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "base64-sol/base64.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721URIStorage {
    // star code: PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDAiIGhlaWdodD0iMjAwIiB2aWV3Qm94PSItMTAwIC0xMDAgMjAwIDIwMCI+ICAgICAgCiAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMCA1KSI+CiAgICA8Zz4KICAgICAgPHBvbHlnb24gcG9pbnRzPSIwLDAgMzYsLTUwIDAsLTEwMCIgZmlsbD0iI0VERDhCNyIgLz4KICAgICAgPHBvbHlnb24gcG9pbnRzPSIwLDAgLTM2LC01MCAwLC0xMDAiIGZpbGw9IiNFNUMzOUMiIC8+CiAgICA8L2c+CiAgICA8ZyB0cmFuc2Zvcm09InJvdGF0ZSg3MikiPgogICAgICA8cG9seWdvbiBwb2ludHM9IjAsMCAzNiwtNTAgMCwtMTAwIiBmaWxsPSIjRUREOEI3IiAvPgogICAgICA8cG9seWdvbiBwb2ludHM9IjAsMCAtMzYsLTUwIDAsLTEwMCIgZmlsbD0iI0U1QzM5QyIgLz4KICAgIDwvZz4KICAgIDxnIHRyYW5zZm9ybT0icm90YXRlKC03MikiPgogICAgICA8cG9seWdvbiBwb2ludHM9IjAsMCAzNiwtNTAgMCwtMTAwIiBmaWxsPSIjRUREOEI3IiAvPgogICAgICA8cG9seWdvbiBwb2ludHM9IjAsMCAtMzYsLTUwIDAsLTEwMCIgZmlsbD0iI0U1QzM5QyIgLz4KICAgIDwvZz4KICAgIDxnIHRyYW5zZm9ybT0icm90YXRlKDE0NCkiPgogICAgICA8cG9seWdvbiBwb2ludHM9IjAsMCAzNiwtNTAgMCwtMTAwIiBmaWxsPSIjRUREOEI3IiAvPgogICAgICA8cG9seWdvbiBwb2ludHM9IjAsMCAtMzYsLTUwIDAsLTEwMCIgZmlsbD0iI0U1QzM5QyIgLz4KICAgIDwvZz4KICAgIDxnIHRyYW5zZm9ybT0icm90YXRlKC0xNDQpIj4KICAgICAgPHBvbHlnb24gcG9pbnRzPSIwLDAgMzYsLTUwIDAsLTEwMCIgZmlsbD0iI0VERDhCNyIgLz4KICAgICAgPHBvbHlnb24gcG9pbnRzPSIwLDAgLTM2LC01MCAwLC0xMDAiIGZpbGw9IiNFNUMzOUMiIC8+CiAgICA8L2c+CiAgPC9nPgo8L3N2Zz4=
    // snowflake: PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDAiIGhlaWdodD0iMjAwIiB2aWV3Qm94PSItMTAwIC0xMDAgMjAwIDIwMCI+CiAgPGRlZnM+CiAgICA8cGF0aAogICAgICBpZD0iYnJhbmNoIgogICAgICBkPSIKICAgICAgICBNIDAgMCBMIDAgLTkwCiAgICAgICAgTSAwIC0yMCBMIDIwIC0zNAogICAgICAgIE0gMCAtMjAgTCAtMjAgLTM0CiAgICAgICAgTSAwIC00MCBMIDIwIC01NAogICAgICAgIE0gMCAtNDAgTCAtMjAgLTU0CiAgICAgICAgTSAwIC02MCBMIDIwIC03NAogICAgICAgIE0gMCAtNjAgTCAtMjAgLTc0IgogICAgICBzdHJva2U9IiNFNUMzOUMiCiAgICAgIHN0cm9rZS13aWR0aD0iNSIKICAgIC8+CiAgPC9kZWZzPgoKICA8dXNlIGhyZWY9IiNicmFuY2giIC8+CiAgPHVzZSBocmVmPSIjYnJhbmNoIiB0cmFuc2Zvcm09InJvdGF0ZSg2MCkiIC8+CiAgPHVzZSBocmVmPSIjYnJhbmNoIiB0cmFuc2Zvcm09InJvdGF0ZSgxMjApIiAvPgogIDx1c2UgaHJlZj0iI2JyYW5jaCIgdHJhbnNmb3JtPSJyb3RhdGUoMTgwKSIgLz4KICA8dXNlIGhyZWY9IiNicmFuY2giIHRyYW5zZm9ybT0icm90YXRlKDI0MCkiIC8+CiAgPHVzZSBocmVmPSIjYnJhbmNoIiB0cmFuc2Zvcm09InJvdGF0ZSgzMDApIiAvPgo8L3N2Zz4=
    // christmas tree: PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDAiIGhlaWdodD0iNDAwIiB2aWV3Qm94PSItMTAwIC0yMDAgMjAwIDQwMCI+CiAgPHBhdGgKICAgIGQ9IgogICAgICBNIDAgLTgwCiAgICAgIFEgNSAtNzUgMCAtNzAKICAgICAgUSAtMTAgLTY1IDAgLTYwCiAgICAgIFEgMTUgLTU1IDAgLTUwCiAgICAgIFEgLTIwIC00NSAwIC00MAogICAgICBRIDI1IC0zNSAwIC0zMAogICAgICBRIC0zMCAtMjUgMCAtMjAKICAgICAgUSAzNSAtMTUgMCAtMTAKICAgICAgUSAtNDAgLTUgMCAwCiAgICAgIFEgNDUgNSAwIDEwCiAgICAgIFEgLTUwIDE1IDAgMjAKICAgICAgUSA1NSAyNSAwIDMwCiAgICAgIFEgLTYwIDM1IDAgNDAKICAgICAgUSA2NSA0NSAwIDUwCiAgICAgIFEgLTcwIDU1IDAgNjAKICAgICAgUSA3NSA2NSAwIDcwCiAgICAgIFEgLTgwIDc1IDAgODAKICAgICAgUSA4NSA4NSAwIDkwCiAgICAgIFEgLTkwIDk1IDAgMTAwCiAgICAgIFEgOTUgMTA1IDAgMTEwCiAgICAgIFEgLTEwMCAxMTUgMCAxMjAKICAgICAgTCAwIDE0MAogICAgICBMIDIwIDE0MAogICAgICBMIC0yMCAxNDAiCiAgICBmaWxsPSJub25lIgogICAgc3Ryb2tlPSIjMEM1QzRDIgogICAgc3Ryb2tlLXdpZHRoPSI1IgogIC8+Cjwvc3ZnPg==
    // json: {"name":"Christmas star","description":"Special Christmas star badge","image":"data:image/svg+xml;base64,CODE_ABOVE"}

    event onNFTMint(uint indexed tokenId, address indexed owner);

    mapping(address => uint) lastMintAt;

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("SpecialGift", "SPECIALGIFT") {
        console.log("This contract mints my NFTs?! awesome!");
    }

    function createStar(string memory _firstColor, string memory _secondColor)
        private
        pure
        returns (string memory)
    {
        string
            memory starFirstPart = '<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="-100 -100 200 200"><g transform="translate(0 5)"><g><polygon points="0,0 36,-50 0,-100" fill="';
        string
            memory starSecondPart = '"/><polygon points="0,0 -36,-50 0,-100" fill="';
        string
            memory starThirdPart = '"/></g><g transform="rotate(72)"><polygon points="0,0 36,-50 0,-100" fill="';
        string
            memory starFourthPart = '"/><polygon points="0,0 -36,-50 0,-100" fill="';
        string
            memory starFifthPart = '"/></g><g transform="rotate(-72)"><polygon points="0,0 36,-50 0,-100" fill="';
        string
            memory starSixthPart = '"/><polygon points="0,0 -36,-50 0,-100" fill="';
        string memory starSeventhPart = '"/></g></g></svg>';
        string memory svg1 = string(
            abi.encodePacked(
                starFirstPart,
                _firstColor,
                starSecondPart,
                _secondColor,
                starThirdPart,
                _firstColor
            )
        );
        string memory svg2 = string(
            abi.encodePacked(
                starFourthPart,
                _secondColor,
                starFifthPart,
                _firstColor,
                starSixthPart,
                _secondColor,
                starSeventhPart
            )
        );
        string memory svg = string(abi.encodePacked(svg1, svg2));
        return svg;
    }

    function createSnowflake(string memory _color)
        private
        pure
        returns (string memory)
    {
        string
            memory snowflakePartOne = '<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="-100 -100 200 200"><defs><path id="branch" d="M 0 0 L 0 -90 M 0 -20 L 20 -34 M 0 -20 L -20 -34 M 0 -40 L 20 -54 M 0 -40 L -20 -54 M 0 -60 L 20 -74 M 0 -60 L -20 -74" stroke="';
        string
            memory snowflakePartTwo = '" stroke-width="5"/></defs><use href="#branch" /><use href="#branch" transform="rotate(60)" /><use href="#branch" transform="rotate(120)" /><use href="#branch" transform="rotate(180)" /><use href="#branch" transform="rotate(240)" /><use href="#branch" transform="rotate(300)" /></svg>';
        string memory svg = string(
            abi.encodePacked(snowflakePartOne, _color, snowflakePartTwo)
        );
        return svg;
    }

    function createChristmasTree(string memory _color)
        private
        pure
        returns (string memory)
    {
        string
            memory treePartOne = '<svg xmlns="http://www.w3.org/2000/svg" width="200" height="400" viewBox="-100 -200 200 400"><path d="M 0 -80 Q 5 -75 0 -70 Q -10 -65 0 -60 Q 15 -55 0 -50 Q -20 -45 0 -40 Q 25 -35 0 -30 Q -30 -25 0 -20 Q 35 -15 0 -10 Q -40 -5 0 0 Q 45 5 0 10 Q -50 15 0 20 Q 55 25 0 30 Q -60 35 0 40 Q 65 45 0 50 Q -70 55 0 60 Q 75 65 0 70 Q -80 75 0 80 Q 85 85 0 90 Q -90 95 0 100 Q 95 105 0 110 Q -100 115 0 120 L 0 140 L 20 140 L -20 140" fill="none" stroke="';
        string memory treePartTwo = '" stroke-width="5"/></svg>';
        string memory svg = string(
            abi.encodePacked(treePartOne, _color, treePartTwo)
        );
        return svg;
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    modifier requireCooldown(uint _time) {
        require(lastMintAt[msg.sender] + _time < block.timestamp);
        _;
    }

    modifier checkMax(uint max) {
        require(_tokenIds.current() < max);
        _;
    }

    function makeAnEpicNFT(
        string memory _firstColor,
        string memory _secondColor,
        uint256 max
    ) public requireCooldown(1 minutes) checkMax(max) {
        uint256 newItemId = _tokenIds.current();
        uint256 randomNumber = random(
            string(abi.encodePacked("SPECIAL_NFT", Strings.toString(newItemId)))
        );
        uint256 rand = randomNumber % 3;
        string memory nft;
        if (rand == 0) {
            nft = createStar(_firstColor, _secondColor);
        } else if (rand == 1) {
            nft = createSnowflake(_firstColor);
        } else {
            nft = createChristmasTree(_firstColor);
        }

        string[48] memory adjectives = [
            "August",
            "Baronial",
            "Gallant",
            "Glorious",
            "Grand",
            "Heroic",
            "Imposing",
            "Lavish",
            "Luxurious",
            "Magnificent",
            "Monumental",
            "Noble",
            "Ornate",
            "Proud",
            "Regal",
            "Rich",
            "Royal",
            "Splendid",
            "Superb",
            "Artful",
            "Genteel",
            "Polished",
            "Sophisticated",
            "Classic",
            "Conservative",
            "Exquisite",
            "Quiet",
            "Restrained",
            "Understated",
            "Aristocratic",
            "Patrician",
            "Chic",
            "Fashionable",
            "In",
            "Modish",
            "Posh",
            "Sharp",
            "Sleek",
            "Smart",
            "Snappy",
            "Stylish",
            "Swagger",
            "Swank",
            "Affected",
            "Grandiose",
            "Ostentatious",
            "Pretentious",
            "Recherche"
        ];
        string[3] memory artName = ["crown", "shine", "wave"];
        uint256 randNameNum = random(
            string(
                abi.encodePacked("ELEGANT_NAME", Strings.toString(newItemId))
            )
        );
        uint256 randNameIndex = randNameNum % adjectives.length;
        string memory nftName = string(
            abi.encodePacked(adjectives[randNameIndex], " ", artName[rand])
        );
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name":"',
                        nftName,
                        '","description":"Special random gift generated by Mahdieh.dev","image":"data:image/svg+xml;base64,',
                        Base64.encode(bytes(nft)),
                        '"}'
                    )
                )
            )
        );
        console.log(json);
        _safeMint(msg.sender, newItemId);
        string memory finalTokenURI = string(
            abi.encodePacked("data:application/json;base64,", json)
        );
        _setTokenURI(newItemId, finalTokenURI);
        _tokenIds.increment();
        lastMintAt[msg.sender] = block.timestamp;
        emit onNFTMint(newItemId, msg.sender);
        console.log("And NFT w/ ID %s is minted to %s", newItemId, msg.sender);
    }
}
