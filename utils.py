columns_to_drop = [
    "ANOMES_DIA",
    "ANO_TRATAM",
    "ANOMES_TRA",
    "MUN_RESID",
    "MUN_TRATAM",
    "MUN_DIAG",
    "CNES_DIAG",
    "CNES_TRAT",
    "TEMPO_TRAT",
    "CNS_PAC",
    "DT_NASC",
    "UF_DIAGN",
    "UF_RESID",
    "UF_TRATAM",
]

cid_translation = {
    0: [
        "D00",
        "D01",
        "D37",
        "C00",
        "C01",
        "C02",
        "C03",
        "C04",
        "C05",
        "C06",
        "C07",
        "C08",
        "C09",
        "C14",
        "C15",
        "C16",
        "C17",
        "C18",
        "C19",
        "C20",
        "C21",
        "C22",
        "C23",
        "C24",
        "C26",
    ],
    1: [
        "D02",
        "D38",
        "C10",
        "C11",
        "C12",
        "C13",
        "C30",
        "C31",
        "C32",
        "C33",
        "C34",
        "C39",
    ],
    2: ["D03", "D04", "C43", "C44", "C46"],
    3: [
        "D05",
        "D06",
        "D07",
        "D39",
        "D40",
        "D41",
        "C50",
        "C51",
        "C52",
        "C53",
        "C54",
        "C55",
        "C56",
        "C57",
        "C58",
        "C60",
        "C61",
        "C62",
        "C63",
    ],
    4: ["D42", "D43", "C47", "C70", "C71", "C72"],
    5: ["D44", "C25", "C37", "C73", "C74", "C75"],
    6: [
        "D45",
        "D46",
        "D47",
        "C77",
        "C81",
        "C82",
        "C83",
        "C84",
        "C85",
        "C88",
        "C90",
        "C91",
        "C92",
        "C93",
        "C94",
        "C95",
        "C96",
    ],
    7: ["C40", "C41", "C45", "C48", "C49"],
    8: ["C38"],
    9: ["C64", "C65", "C66", "C67", "C68"],
    # Outros tem localizacoes nao especificadas, olhos e metastases
    10: ["D09", "D48", "C69", "C76", "C78", "C79", "C80", "C97"],
}

cat_dict = {
    "ANO_DIAGN": {
        "cats": [
            2013,
            2014,
            2015,
            2016,
            2017,
            2018,
            2019,
            2020,
            2021,
            2022,
            2023,
            2024,
        ],
        "ordered": True,
    },
    "SEXO": {"cats": ["F", "M"], "ordered": False},
    "TRATAMENTO": {
        "cats": [1, 2, 3, 4, 5],
        "ordered": False,
    },
    "DIAGNOSTIC": {
        "cats": [1, 2, 3, 4],
        "ordered": False,
    },
    "ESTADIAM": {
        "cats": [0, 1, 2, 3, 4, 5, 9],
        "ordered": True,
    },
    "DIAG_DETH": {
        "cats": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        "ordered": False,
    },
}
