//
//  ClientCatalogPresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit
import Combine

final class ClientCatalogPresentable: BaseView, UISearchBarDelegate {

    private var medicines: [ClientCatalogModel] = [
        ClientCatalogModel(image: "k1",
                           name: "Агроника Гранд",
                           subName: "Мезотрион, 70 г/л + Никосульфурон, 40 г/л",
                           description: "Послевсходовый гербицид для контроля многолетних, однолетних"
                           + " злаковых и двудольных сорняков на кукурузе"),
        ClientCatalogModel(image: "k2",
                           name: "Арбалет®",
                           subName: "2,4-Д (2-этилгексиловый эфир), 300 г/л + Флорасулам, 6,25 г/л",
                           description: "Послевсходовый двухкомпонентный гербицид для защиты от широкого спектра"
                           + " двудольных сорняков, в т. ч. устойчивых к 2,4- Д и некоторых корнеотпрысковых видов"),
        ClientCatalogModel(image: "k3",
                           name: "Бастер®",
                           subName: "Бентазон, 460 г/л + Имазамокс, 25 г/л",
                           description: "Высокоэффективный двухкомпонентный гербицид для борьбы с однолетними"
                           + " двудольными и злаковыми"
                           + " и некоторыми многолетними двудольными сорняками на посевах сои и гороха"),
        ClientCatalogModel(image: "k4",
                           name: "Берилл®",
                           subName: "Клетодим, 120 г/л",
                           description: "Селективный, системный, противозлаковый гербицид быстрого"
                           + " действия для борьбы с широким спектром злаковых сорняков"),
        ClientCatalogModel(image: "k5",
                           name: "Бетаниум®",
                           subName: "Этофумезат, 112 г/л + Фенмедифам, 91 г/л + Десмедифам, 71 г/л",
                           description: "Послевсходовый гербицид для борьбы с сорными растениями при"
                           + " возделывании сахарной, столовой и кормовой свеклы"),
        ClientCatalogModel(image: "k6",
                           name: "Бетаниум® 22",
                           subName: "Десмедифам, 160 г/л + Фенмедифам, 160 г/л",
                           description: "Гербицид для борьбы с однолетними сорняками"
                           + " на посевах свеклы кормовой и сахарной"),
        ClientCatalogModel(image: "k7",
                           name: "Гарнизон®",
                           subName: "Бентазон, 480 г/л",
                           description: "Контактный послевсходовый гербицид для защиты зерновых с подсевом бобовых"
                           + " трав и однолетних травосмесей,"
                           + " обладающий широким спектром действия на двудольные сорняки"),
        ClientCatalogModel(image: "k8",
                           name: "Гербикс",
                           subName: "МЦПА, 500 г/л",
                           description: "Селективный гербицид системного действия для подавления однолетних"
                           + " двудольных сорняков при послевсходовом применении"),
        ClientCatalogModel(image: "k9",
                           name: "Глифор®",
                           subName: "Глифосат (изопропиламинная соль), 360 г/л",
                           description: "Гербицид общеистребляющего действия для борьбы с вредной"
                           + " растительностью в сельском, лесном и коммунальном хозяйствах"),
        ClientCatalogModel(image: "k10",
                           name: "Глифор® Форте",
                           subName: "Глифосат (калийная соль), 540 г/л",
                           description: "Высокоэффективный системный гербицид сплошного действия для уничтожения"
                           + " однолетних и многолетних сорняков, а также древесно-кустарниковой растительности"),
        ClientCatalogModel(image: "k11",
                           name: "Гран-при",
                           subName: "Трибенурон-метил, 750 г/кг",
                           description: "Высокоэффективный послевсходовый гербицид для борьбы"
                           + " с широколиственными сорняками"),
        ClientCatalogModel(image: "k12",
                           name: "Дентайр®",
                           subName: "Имазамокс, 40 г/л",
                           description: "Гербицид системного действия для послевсходового применения"
                           + " против однолетних злаковых и двудольных сорняков в посевах сои, гороха"),
        ClientCatalogModel(image: "k12,5",
                           name: "Канон",
                           subName: "Галоксифоп-П-метил, 104 г/л",
                           description: "Гербицид для защиты посевов от однолетних и многолетних злаковых сорняков"),
        ClientCatalogModel(image: "k14",
                           name: "Клерк",
                           subName: "Клетодим, 240 г/л",
                           description: "Послевсходовый высокоэффективный гербицид против"
                           + " однолетних и многолетних злаковых сорняков"),
        ClientCatalogModel(image: "k15",
                           name: "Маркос®",
                           subName: "Имазамокс, 33 г/л + Имазетапир, 50 г/л",
                           description: "Гербицид для уничтожения широкого спектра сорняков на подсолнечнике"),
        ClientCatalogModel(image: "k16",
                           name: "Мегалит®",
                           subName: "Клопиралид, 267 г/л + Пиклорам, 67 г/л",
                           description: "Гербицид для борьбы с некоторыми однолетними и многолетними двудольными"
                           + " сорняками, в том числе трудноискоренимыми растениями"),
        ClientCatalogModel(image: "k17",
                           name: "Монолит®",
                           subName: "Клопиралид, 750 г/кг",
                           description: "Системный селективный гербицид для борьбы с однолетними двудольными"
                           + " сорняками, а также со злостными трудноистребимыми корнеотпрысковыми многолетниками"),
        ClientCatalogModel(image: "k18",
                           name: "Октапон Экстра",
                           subName: "2,4-Д (2-этилгексиловый эфир), 500 г/л",
                           description: "Гербицид для борьбы с однолетними и некоторыми многолетними"
                           + " (осоты и др.) двудольными сорняками"),
        ClientCatalogModel(image: "k19",
                           name: "Олимп",
                           subName: "Трифлусульфурон-метил, 500 г/кг",
                           description: "Высокоэффективный послевсходовый гербицид широкого спектра действия"
                           + " для контроля широколиственных сорняков в посевах сахарной и кормовой свеклы"),
        ClientCatalogModel(image: "k20",
                           name: "Рапира®",
                           subName: "2,4-Д (2-этилгексиловый эфир), 564 г/л",
                           description: "Селективный гербицид системного действия для подавления однолетних двудольных"
                           + " и многолетних двудольных сорняков, при послевсходовом"
                           + " применении в посевах зерновых культур и кукурузы"),
        ClientCatalogModel(image: "k21",
                           name: "Рефери",
                           subName: "Дикамба, 351 г/л",
                           description: "Послевсходовый гербицид широкого спектра действия для"
                           + " контроля широколистных сорняков в посевах кукурузы,"
                           + " в том числе зерновых колосовых культур, озимых и яровых пшеницы и ячменя, ржи и проса"),
        ClientCatalogModel(image: "k22",
                           name: "Сапфир®",
                           subName: "Имазетапир, 100 г/л",
                           description: "Высокоэффективный гербицид для уничтожения"
                           + " широкого спектра однолетних и многолетних злаковых и двудольных, в том"
                           + " числе карантинных сорняков в посевах сои и гороха"),
        ClientCatalogModel(image: "k23",
                           name: "Тайгер",
                           subName: "Феноксапроп-П-этил, 69 г/л + Клоквинтосет- мексил, 34,5 г/л",
                           description: "Селективный противозлаковый"
                           + " гербицид полного системного действия для послевсходового применения против"
                           + " однолетних злаковых сорняков на посевах зерновых культур"),
        ClientCatalogModel(image: "k24",
                           name: "Тайгер 100",
                           subName: "Феноксапроп-П-этил, 100 г/л + Клоквинтосет- мексил, 27 г/л",
                           description: "Послевсходовый гербицид широкого спектра действия для"
                           + " борьбы с сорняками в посевах зерновых культур"),
        ClientCatalogModel(image: "k25",
                           name: "Тристар®",
                           subName: "Прометрин, 500 г/л",
                           description: "Почвенный гербицид для для борьбы с однолетними злаковыми"
                           + " и двудольными сорняками, в том числе карантинными"),
        ClientCatalogModel(image: "k26",
                           name: "Фирман",
                           subName: "Фомесафен, 250 г/л",
                           description: "Селективный послевсходовый гербицид для контроля широкого спектра"
                           + " двудольных сорняков в посевах сои, в том числе трудноконтролируемых"),
        ClientCatalogModel(image: "k27",
                           name: "Цицерон®",
                           subName: "Римсульфурон, 250 г/кг",
                           description: "Селективный гербицид системного действия для борьбы с однолетними и"
                           + " многолетними двудольными и злаковыми сорняками при послевсходовом применении"),
        ClientCatalogModel(image: "k28",
                           name: "Челленджер®",
                           subName: "Имазамокс, 33 г/л + Имазапир, 15 г/л",
                           description: "Гербицид для уничтожения широкого спектра сорняков на подсолнечнике")
    ]

    var selectedMedicine = CurrentValueSubject<ClientCatalogModel?, Never>(nil)

        private lazy var tableView: UITableView = {
            let table = UITableView()
            table.delegate = self
            table.dataSource = self
            table.backgroundColor = .white
            return table
        }()

        private lazy var searchBar: UISearchBar = {
            let searchBar = UISearchBar()
            searchBar.delegate = self
            return searchBar
        }()

        private var filteredMedicines: [ClientCatalogModel] = []

    override func onConfigureView() {
        backgroundColor = .white
        filteredMedicines = medicines
        tableView.reloadData()
    }

        override func onAddSubviews() {
            addSubview(searchBar)
            addSubview(tableView)
            tableView.register(ClientCatalogCell.self, forCellReuseIdentifier: "CellIdentifier")
        }

        override func onSetupConstraints() {
            searchBar.snp.makeConstraints { make in
                make.top.equalTo(safeAreaLayoutGuide.snp.top)
                make.leading.trailing.equalToSuperview()
            }

            tableView.snp.makeConstraints { make in
                make.top.equalTo(searchBar.snp.bottom)
                make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
                make.leading.trailing.equalToSuperview()
            }
        }

        // MARK: - UISearchBarDelegate

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                filteredMedicines = medicines
            } else {
                filteredMedicines = medicines.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
            tableView.reloadData()
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }

    extension ClientCatalogPresentable: UITableViewDelegate, UITableViewDataSource {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func numberOfSections(in tableView: UITableView) -> Int {
            return filteredMedicines.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier",
                                                           for: indexPath) as? ClientCatalogCell else {
                fatalError("Unable to dequeue ClientCatalogCell")
            }
            cell.configure(model: filteredMedicines[indexPath.section])
            return cell
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            selectedMedicine.send(filteredMedicines[indexPath.section])
        }
    }
