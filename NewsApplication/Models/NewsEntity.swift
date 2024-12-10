//
//  NewsEntity.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import Foundation

struct NewsEntity {
    let id: UUID = UUID()

    let thumbnail: String
    let title: String
    let date: String
    let urlText: String
    let descr: String
    
    static func mockData() -> [NewsEntity] {
        [
            NewsEntity(thumbnail: "mokphoto1", title: "Oleg man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "https://mail.ru", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk, The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk. The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk "),
            NewsEntity(thumbnail: "mokphoto2", title: "Vadim to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru/asdfasdf/asdfasdf/asdfasdf/asdfasdfasdfasdf/asdfasdf/asdfasdf", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in")
        ]
    }
}
