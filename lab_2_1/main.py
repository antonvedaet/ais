from typing import List
from urllib import request
import janus_swi as janus

translations = {
    "пво": "category(anti_air",
    "легкий": "category(light_tank",
    "средний": "category(medium_tank",
    "тяжелый": "category(heavy_tank",
    "пт": "category(anti_tank",
    "штурм": "designed_for_assault(",
    "разведка": "designed_for_recon(",
    "танковый бой": "engages_tanks(",
    "воздушный бой": "engages_aircraft(",
    "общее назначение": "balanced_design("
}


def proccess_input(request: str) -> List[str] | str:
    spl_request = request.split(",")
    spl_request = [i.strip() for i in spl_request]

    if not spl_request[-1].isdigit():
        return janus.query_once(
            f"{translations[spl_request[0]]}, {spl_request[-1]})", {})

    if spl_request[-1].isdigit():
        q = janus.query(f"{translations[spl_request[0]]}, Tank)")
        res = []
        for _ in range(int(spl_request[-1])):
            res.append(q.next()["Tank"])
        return res


def main(file: str):
    janus.consult(file)

    print("""
          Введите характеристики танка через запятую и желаемое кол-во записей ,например:
          пво,5
          или введите свойство
          не тяжелый,2
          или выполняемую задачу
          разведка,1
          так же можно ввести танк и свойство чтобы выяснить принадлежит ли оно ему
          тяжелый,valentine_I
          """)

    while True:
        request = input()
        print(proccess_input(request))


if __name__ == "__main__":
    main("lab1.pl")
