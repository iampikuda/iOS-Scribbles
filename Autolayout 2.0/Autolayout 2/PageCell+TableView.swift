//
//  PageCell+TableView.swift
//  Autolayout 2
//
//  Created by Oluwadamisi Pikuda on 05/01/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

extension PageCell: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath)
        let textCell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! TableCell

        headerCell.textLabel?.text = page?.table.headerText
        headerCell.textLabel?.textAlignment = .center
        headerCell.selectionStyle = .none
        textCell.selectionStyle = .none

        if indexPath.item == 0 {
            return headerCell
        }

        tableView.isScrollEnabled = false

        tableView.rowHeight = tableView.bounds.height - headerCell.bounds.height - 50

        textCell.bodyText = page?.table.bodyText

        return textCell
    }
}
