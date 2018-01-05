//
//  ViewModel.swift
//  Autolayout 2
//
//  Created by Oluwadamisi Pikuda on 15/12/2017.
//  Copyright © 2017 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

public class ViewModel {

    public let pages: [PageModel]

    public init() {
        self.pages = [
            PageModel(imageName: "lookie 1",
                      table: TableModel(headerText: "With Femi",
                                        bodyText: """
Are you ready for loads and loads of fun! Let's see, I know no one likes to
watch someone else typere you ready for loads and loads of fun! Let's see, I
know no one likes to watch someone else typere you ready for loads and loads of
fun! Let's see, I know no one likes to watch someone else typere you ready for
loads and loads of fun! Let's see, I know no one likes to watch someone else
typere you ready for loads and loads of fun! Let's see, I know no one likes to
watch someone else typere you ready for loads and loads of fun! Let's see, I
know no one likes to watch someone else typere you ready for loads and loads of
fun! Let's see, I know no one likes to watch someone else typere you ready for
 loads and loads of fun! Let's see, I know no one likes to watch someone else
typere you ready for loads and loads of fun! Let's see, I know no one likes to
watch someone else typere you ready for loads and loads of fun! Let's see, I know
 no one likes to watch someone else typere you ready for loads and loads of fun!
Let's see, I know no one likes to watch someone else typere you ready for loads
 and loads of fun! Let's see, I know no one likes to watch someone else typere
you ready for loads and loads of fun! Let's see, I know no one likes to watch
someone else type
""") ),
            PageModel(imageName: "lookie 2",
                      table: TableModel(headerText: "With Tams",
                                        bodyText: """
Lorem ipsum dolor sit amet, ante eu quis quisque, nulla cras cursus lobortis
vestibulum suspendisse. Nec etiam risus quis, id arcu consequat, enim proin
viverra donec vel a luctus. Viverra quisque mauris mi cum, et nisl, proin lacus
magna litora ultrices justo cras. Mauris laboris tortor nunc, molestie at nonummy,
aptent tellus iaculis in eget nulla, imperdiet volutpat nec suscipit massa mauris.
Proin posuere vulputate enim potenti, eget ac amet pede vestibulum tortor, quisque
curabitur integer eros, vestibulum nam duis luctus. Lacinia sollicitudin. Ac
tempora, interdum sollicitudin ac lacus varius ullamcorper, platea sodales
fringilla vivamus, dui mauris aliquam ipsum.
""") ),
            PageModel(imageName: "lookie 3",
                      table: TableModel(headerText: "With Mai and Muna",
                                        bodyText: """
Dui magnis elementum pellentesque sed diam, sem cras accusamus. Veniam bibendum.
Velit sodales felis suspendisse duis lorem convallis. Sem libero purus
consectetuer, tristique lacinia nec dictum, id nec, sed consequat vivamus vel,
quam consequat. Eu ac mattis. Sed erat hac bibendum molestie neque sem. Cras
fusce aliquam aliquam at at, arcu dignissim vel ultrices donec sed vivamus,
vehicula at elit adipiscing, purus ipsum nulla ac cursus egestas, enim elit
vulputate lacinia interdum a. Lacus iaculis et.
""") ),
            PageModel(imageName: "lookie 4",
                      table: TableModel(headerText: "With Folayemi",
                                        bodyText: """
Habitant vitae, lacinia nulla arcu cras dolor turpis, feugiat tellus eget
aliquam. Donec quo praesent quis, iaculis ultricies sapien rutrum ac. A dapibus,
vehicula tellus sunt quam vivamus, quisque pharetra fusce dui, mollis sollicitudin
sit id aenean purus massa, vestibulum aliquet. Adipiscing ipsum parturient aliquam
pellentesque, neque congue porttitor nec at sit, phasellus ac varius consequat,
libero eleifend sollicitudin nulla quis, suscipit ultricies ac fermentum nullam
sit. Montes sodales, arcu vulputate proin ut nec nisl et, condimentum natoque ac
fusce sit laoreet nec, augue eros nisl at justo viverra. Imperdiet nullam placerat
pede vitae mi, justo lacus vestibulum aliquet, risus feugiat nunc leo turpis nibh,
reprehenderit suscipit tristique. Sagittis lacus ipsum morbi aliquet, vehicula do,
gravida diam nam dolor numquam senectus, risus vulputate nisl libero porttitor
dictum est, blandit tincidunt dolor. Justo ut metus tortor fringilla erat, felis
neque elementum a, repellat turpis tellus.
""") )
        ]
    }
}
