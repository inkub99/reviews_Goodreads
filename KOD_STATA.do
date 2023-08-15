import delimited "C:\Users\aspir\Baza_Goodreads.csv"

* MODELE PROBITOWE; ZMIENNA OBJAŚNIANA - kolejna_recenzja

probit kolejna_recenzja c.ocena brak_oceny i.info_demografia log_l_ocen i.seria_nieostatni_tom i.seria_ostatni_tom log_l_stron log_dlugosc_recenzji i.pozna_recenzja i.wczesna_recenzja rok_2023 rok_2022 i.literaturaobyczajowaromans i.kryminał i.literaturapiękna i.fantasy i.sciencefiction i.fikcjahistoryczna i.thiller i.dladzieci i.chicklit i.horror i.manga i.powieśćgraficzna c.ocena#i.info_demografia c.ocena#i.duzo_ocen c.ocena#i.malo_ocen c.ocena#i.seria_nieostatni_tom c.ocena#i.seria_ostatni_tom c.ocena#i.krotka_recenzja c.ocena#i.dluga_recenzja c.ocena#i.pozna_recenzja c.ocena#i.wczesna_recenzja c.ocena#i.literaturaobyczajowaromans c.ocena#i.kryminał c.ocena#i.literaturapiękna c.ocena#i.fantasy c.ocena#i.sciencefiction c.ocena#i.fikcjahistoryczna c.ocena#i.thiller c.ocena#i.dladzieci c.ocena#i.chicklit c.ocena#i.horror c.ocena#i.manga c.ocena#i.powieśćgraficzna 

predict prob, pr
sum prob 
sum prob if info_demografia == 1
sum prob if malo_ocen == 1
sum prob if duzo_ocen == 1
sum prob if seria_nieostatni_tom == 1
sum prob if seria_ostatni_tom == 1
sum prob if wczesna_recenzja == 1
sum prob if pozna_recenzja == 1
sum prob if krotka_recenzja == 1
sum prob if dluga_recenzja == 1
sum prob if literaturaobyczajowaromans == 1
sum prob if kryminał == 1
sum prob if literaturapiękna == 1
sum prob if fantasy == 1
sum prob if sciencefiction == 1
sum prob if fikcjahistoryczna == 1
sum prob if thiller == 1
sum prob if dladzieci == 1
sum prob if chicklit == 1
sum prob if horror == 1
sum prob if manga == 1
sum prob if powieśćgraficzna == 1

replace ocena = ocena + 1
predict prob_plus, pr
replace ocena = ocena - 2
predict prob_minus, pr
replace ocena = ocena + 1 

qui sum prob if ocena >= 2 
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4
local mean3 = r(mean)
qui sum prob if ocena <= 4
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & info_demografia == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & info_demografia == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & info_demografia == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & info_demografia == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & malo_ocen == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & malo_ocen == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & malo_ocen == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & malo_ocen == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & duzo_ocen == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & duzo_ocen == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & duzo_ocen == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & duzo_ocen == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & seria_nieostatni_tom == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & seria_nieostatni_tom == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & seria_nieostatni_tom == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & seria_nieostatni_tom == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & seria_ostatni_tom == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & seria_ostatni_tom == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & seria_ostatni_tom == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & seria_ostatni_tom == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & wczesna_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & wczesna_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & wczesna_recenzja  == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & wczesna_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & pozna_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & pozna_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & pozna_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & pozna_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & krotka_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & krotka_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & krotka_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & krotka_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & dluga_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & dluga_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & dluga_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & dluga_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & literaturaobyczajowaromans  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & literaturaobyczajowaromans  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & literaturaobyczajowaromans == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & literaturaobyczajowaromans  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & kryminał  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & kryminał  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & kryminał == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & kryminał  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & literaturapiękna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & literaturapiękna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & literaturapiękna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & literaturapiękna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & fantasy  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & fantasy  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & fantasy == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & fantasy  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & sciencefiction  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & sciencefiction  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & sciencefiction == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & sciencefiction  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & fikcjahistoryczna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & fikcjahistoryczna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & fikcjahistoryczna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & fikcjahistoryczna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & thiller  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & thiller  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & thiller == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & thiller  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & dladzieci  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & dladzieci  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & dladzieci == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & dladzieci  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & chicklit  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & chicklit  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & chicklit == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & chicklit  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & horror  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & horror  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & horror == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & horror  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & manga  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & manga  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & manga == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & manga  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & powieśćgraficzna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & powieśćgraficzna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & powieśćgraficzna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & powieśćgraficzna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

drop prob
drop prob_minus
drop prob_plus

probit kolejna_recenzja c.roznica brak_oceny i.info_demografia log_l_ocen i.seria_nieostatni_tom i.seria_ostatni_tom log_l_stron log_dlugosc_recenzji i.pozna_recenzja i.wczesna_recenzja rok_2023 rok_2022 i.literaturaobyczajowaromans i.kryminał i.literaturapiękna i.fantasy i.sciencefiction i.fikcjahistoryczna i.thiller i.dladzieci i.chicklit i.horror i.manga i.powieśćgraficzna c.roznica#i.info_demografia c.roznica#i.duzo_ocen c.roznica#i.malo_ocen c.roznica#i.seria_nieostatni_tom c.roznica#i.seria_ostatni_tom c.roznica#i.krotka_recenzja c.roznica#i.dluga_recenzja c.roznica#i.pozna_recenzja c.roznica#i.wczesna_recenzja c.roznica#i.literaturaobyczajowaromans c.roznica#i.kryminał c.roznica#i.literaturapiękna c.roznica#i.fantasy c.roznica#i.sciencefiction c.roznica#i.fikcjahistoryczna c.roznica#i.thiller c.roznica#i.dladzieci c.roznica#i.chicklit c.roznica#i.horror c.roznica#i.manga c.roznica#i.powieśćgraficzna 

probit kolejna_recenzja c.roznica_ksiazka brak_oceny info_demografia log_l_ocen malo_ocen seria_nieostatni_tom seria_ostatni_tom log_l_stron log_dlugosc_recenzji krotka_recenzja dluga_recenzja pozna_recenzja wczesna_recenzja rok_2023 rok_2022 literaturaobyczajowaromans kryminał literaturapiękna fantasy sciencefiction fikcjahistoryczna thiller dladzieci chicklit horror manga powieśćgraficzna c.roznica_ksiazka#i.info_demografia c.roznica_ksiazka#i.duzo_ocen c.roznica_ksiazka#i.malo_ocen c.roznica_ksiazka#i.seria_nieostatni_tom c.roznica_ksiazka#i.seria_ostatni_tom c.roznica_ksiazka#i.krotka_recenzja c.roznica_ksiazka#i.dluga_recenzja c.roznica_ksiazka#i.pozna_recenzja c.roznica_ksiazka#i.wczesna_recenzja c.roznica_ksiazka#i.literaturaobyczajowaromans c.roznica_ksiazka#i.kryminał c.roznica_ksiazka#i.literaturapiękna c.roznica_ksiazka#i.fantasy c.roznica_ksiazka#i.sciencefiction c.roznica_ksiazka#i.fikcjahistoryczna c.roznica_ksiazka#i.thiller c.roznica_ksiazka#i.dladzieci c.roznica_ksiazka#i.chicklit c.roznica_ksiazka#i.horror c.roznica_ksiazka#i.manga c.roznica_ksiazka#i.powieśćgraficzna 

* MODELE PROBITOWE Z EFEKTAMI LOSOWYMI; ZMIENNA OBJAŚNIANA - kolejna_recenzja

xtset link_nr

xtprobit kolejna_recenzja c.ocena brak_oceny i.info_demografia log_l_ocen i.seria_nieostatni_tom i.seria_ostatni_tom log_l_stron log_dlugosc_recenzji i.pozna_recenzja i.wczesna_recenzja rok_2023 rok_2022 i.literaturaobyczajowaromans i.kryminał i.literaturapiękna i.fantasy i.sciencefiction i.fikcjahistoryczna i.thiller i.dladzieci i.chicklit i.horror i.manga i.powieśćgraficzna c.ocena#i.info_demografia c.ocena#i.duzo_ocen c.ocena#i.malo_ocen c.ocena#i.seria_nieostatni_tom c.ocena#i.seria_ostatni_tom c.ocena#i.krotka_recenzja c.ocena#i.dluga_recenzja c.ocena#i.pozna_recenzja c.ocena#i.wczesna_recenzja c.ocena#i.literaturaobyczajowaromans c.ocena#i.kryminał c.ocena#i.literaturapiękna c.ocena#i.fantasy c.ocena#i.sciencefiction c.ocena#i.fikcjahistoryczna c.ocena#i.thiller c.ocena#i.dladzieci c.ocena#i.chicklit c.ocena#i.horror c.ocena#i.manga c.ocena#i.powieśćgraficzna, re

meprobit kolejna_recenzja c.ocena brak_oceny i.info_demografia log_l_ocen i.seria_nieostatni_tom i.seria_ostatni_tom log_l_stron log_dlugosc_recenzji i.pozna_recenzja i.wczesna_recenzja rok_2023 rok_2022 i.literaturaobyczajowaromans i.kryminał i.literaturapiękna i.fantasy i.sciencefiction i.fikcjahistoryczna i.thiller i.dladzieci i.chicklit i.horror i.manga i.powieśćgraficzna c.ocena#i.info_demografia c.ocena#i.duzo_ocen c.ocena#i.malo_ocen c.ocena#i.seria_nieostatni_tom c.ocena#i.seria_ostatni_tom c.ocena#i.krotka_recenzja c.ocena#i.dluga_recenzja c.ocena#i.pozna_recenzja c.ocena#i.wczesna_recenzja c.ocena#i.literaturaobyczajowaromans c.ocena#i.kryminał c.ocena#i.literaturapiękna c.ocena#i.fantasy c.ocena#i.sciencefiction c.ocena#i.fikcjahistoryczna c.ocena#i.thiller c.ocena#i.dladzieci c.ocena#i.chicklit c.ocena#i.horror c.ocena#i.manga c.ocena#i.powieśćgraficzna || link_nr:

predict prob, pr
sum prob 
sum prob if info_demografia == 1
sum prob if malo_ocen == 1
sum prob if duzo_ocen == 1
sum prob if seria_nieostatni_tom == 1
sum prob if seria_ostatni_tom == 1
sum prob if wczesna_recenzja == 1
sum prob if pozna_recenzja == 1
sum prob if krotka_recenzja == 1
sum prob if dluga_recenzja == 1
sum prob if literaturaobyczajowaromans == 1
sum prob if kryminał == 1
sum prob if literaturapiękna == 1
sum prob if fantasy == 1
sum prob if sciencefiction == 1
sum prob if fikcjahistoryczna == 1
sum prob if thiller == 1
sum prob if dladzieci == 1
sum prob if chicklit == 1
sum prob if horror == 1
sum prob if manga == 1
sum prob if powieśćgraficzna == 1

gen nr = _n

qui predict prob_plus if mod(nr, 300) == 0
foreach num of numlist 1 /299 {
    if mod(nr, 300) == `num' {
    	qui replace ocena = ocena + 1 
    	qui predict prob_plus_temp 
    	qui replace prob_plus = prob_plus_temp 
    	qui drop prob_plus_temp
    	qui replace ocena = ocena -1 
}}

qui predict prob_minus if mod(nr, 300) == 0
foreach num of numlist 1 /299 {
    if mod(nr, 300) == `num' {
    	qui replace ocena = ocena - 1 
    	qui predict prob_minus_temp 
    	qui replace prob_minus = prob_minus_temp 
    	qui drop prob_minus_temp
    	qui replace ocena = ocena + 1 
}}


qui sum prob if ocena >= 2 
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4
local mean3 = r(mean)
qui sum prob if ocena <= 4
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & info_demografia == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & info_demografia == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & info_demografia == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & info_demografia == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & malo_ocen == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & malo_ocen == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & malo_ocen == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & malo_ocen == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & duzo_ocen == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & duzo_ocen == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & duzo_ocen == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & duzo_ocen == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & seria_nieostatni_tom == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & seria_nieostatni_tom == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & seria_nieostatni_tom == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & seria_nieostatni_tom == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & seria_ostatni_tom == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & seria_ostatni_tom == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & seria_ostatni_tom == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & seria_ostatni_tom == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & wczesna_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & wczesna_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & wczesna_recenzja  == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & wczesna_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & pozna_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & pozna_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & pozna_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & pozna_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & krotka_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & krotka_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & krotka_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & krotka_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & dluga_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & dluga_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & dluga_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & dluga_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & literaturaobyczajowaromans  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & literaturaobyczajowaromans  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & literaturaobyczajowaromans == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & literaturaobyczajowaromans  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & kryminał  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & kryminał  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & kryminał == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & kryminał  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & literaturapiękna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & literaturapiękna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & literaturapiękna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & literaturapiękna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & fantasy  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & fantasy  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & fantasy == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & fantasy  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & sciencefiction  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & sciencefiction  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & sciencefiction == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & sciencefiction  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & fikcjahistoryczna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & fikcjahistoryczna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & fikcjahistoryczna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & fikcjahistoryczna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & thiller  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & thiller  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & thiller == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & thiller  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & dladzieci  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & dladzieci  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & dladzieci == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & dladzieci  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & chicklit  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & chicklit  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & chicklit == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & chicklit  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & horror  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & horror  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & horror == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & horror  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & manga  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & manga  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & manga == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & manga  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & powieśćgraficzna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & powieśćgraficzna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & powieśćgraficzna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & powieśćgraficzna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

drop prob
drop prob_minus
drop prob_plus
drop nr

meprobit kolejna_recenzja c.roznica brak_oceny i.info_demografia log_l_ocen i.seria_nieostatni_tom i.seria_ostatni_tom log_l_stron log_dlugosc_recenzji i.pozna_recenzja i.wczesna_recenzja rok_2023 rok_2022 i.literaturaobyczajowaromans i.kryminał i.literaturapiękna i.fantasy i.sciencefiction i.fikcjahistoryczna i.thiller i.dladzieci i.chicklit i.horror i.manga i.powieśćgraficzna c.roznica#i.info_demografia c.roznica#i.duzo_ocen c.roznica#i.malo_ocen c.roznica#i.seria_nieostatni_tom c.roznica#i.seria_ostatni_tom c.roznica#i.krotka_recenzja c.roznica#i.dluga_recenzja c.roznica#i.pozna_recenzja c.roznica#i.wczesna_recenzja c.roznica#i.literaturaobyczajowaromans c.roznica#i.kryminał c.roznica#i.literaturapiękna c.roznica#i.fantasy c.roznica#i.sciencefiction c.roznica#i.fikcjahistoryczna c.roznica#i.thiller c.roznica#i.dladzieci c.roznica#i.chicklit c.roznica#i.horror c.roznica#i.manga c.roznica#i.powieśćgraficzna || link_nr:

meprobit kolejna_recenzja c.roznica_ksiazka brak_oceny info_demografia log_l_ocen malo_ocen seria_nieostatni_tom seria_ostatni_tom log_l_stron log_dlugosc_recenzji krotka_recenzja dluga_recenzja pozna_recenzja wczesna_recenzja rok_2023 rok_2022 literaturaobyczajowaromans kryminał literaturapiękna fantasy sciencefiction fikcjahistoryczna thiller dladzieci chicklit horror manga powieśćgraficzna c.roznica_ksiazka#i.info_demografia c.roznica_ksiazka#i.duzo_ocen c.roznica_ksiazka#i.malo_ocen c.roznica_ksiazka#i.seria_nieostatni_tom c.roznica_ksiazka#i.seria_ostatni_tom c.roznica_ksiazka#i.krotka_recenzja c.roznica_ksiazka#i.dluga_recenzja c.roznica_ksiazka#i.pozna_recenzja c.roznica_ksiazka#i.wczesna_recenzja c.roznica_ksiazka#i.literaturaobyczajowaromans c.roznica_ksiazka#i.kryminał c.roznica_ksiazka#i.literaturapiękna c.roznica_ksiazka#i.fantasy c.roznica_ksiazka#i.sciencefiction c.roznica_ksiazka#i.fikcjahistoryczna c.roznica_ksiazka#i.thiller c.roznica_ksiazka#i.dladzieci c.roznica_ksiazka#i.chicklit c.roznica_ksiazka#i.horror c.roznica_ksiazka#i.manga c.roznica_ksiazka#i.powieśćgraficzna || link_nr:

* MODELE PROBITOWE; ZMIENNA OBJAŚNIANA - kontynuacja_czytania

drop if missing(kontynuacja_czytania)

probit kontynuacja_czytania c.ocena brak_oceny i.info_demografia log_l_ocen i.seria_nieostatni_tom i.seria_ostatni_tom log_l_stron log_dlugosc_recenzji i.pozna_recenzja i.wczesna_recenzja rok_2023 rok_2022 i.literaturaobyczajowaromans i.kryminał i.literaturapiękna i.fantasy i.sciencefiction i.fikcjahistoryczna i.thiller i.dladzieci i.chicklit i.horror i.manga i.powieśćgraficzna c.ocena#i.info_demografia c.ocena#i.duzo_ocen c.ocena#i.malo_ocen c.ocena#i.seria_nieostatni_tom c.ocena#i.seria_ostatni_tom c.ocena#i.krotka_recenzja c.ocena#i.dluga_recenzja c.ocena#i.pozna_recenzja c.ocena#i.wczesna_recenzja c.ocena#i.literaturaobyczajowaromans c.ocena#i.kryminał c.ocena#i.literaturapiękna c.ocena#i.fantasy c.ocena#i.sciencefiction c.ocena#i.fikcjahistoryczna c.ocena#i.thiller c.ocena#i.dladzieci c.ocena#i.chicklit c.ocena#i.horror c.ocena#i.manga c.ocena#i.powieśćgraficzna 

predict prob, pr
sum prob 
sum prob if info_demografia == 1
sum prob if malo_ocen == 1
sum prob if duzo_ocen == 1
sum prob if seria_nieostatni_tom == 1
sum prob if seria_ostatni_tom == 1
sum prob if wczesna_recenzja == 1
sum prob if pozna_recenzja == 1
sum prob if krotka_recenzja == 1
sum prob if dluga_recenzja == 1
sum prob if literaturaobyczajowaromans == 1
sum prob if kryminał == 1
sum prob if literaturapiękna == 1
sum prob if fantasy == 1
sum prob if sciencefiction == 1
sum prob if fikcjahistoryczna == 1
sum prob if thiller == 1
sum prob if dladzieci == 1
sum prob if chicklit == 1
sum prob if horror == 1
sum prob if manga == 1
sum prob if powieśćgraficzna == 1

replace ocena = ocena + 1
predict prob_plus, pr
replace ocena = ocena - 2
predict prob_minus, pr
replace ocena = ocena + 1 

qui sum prob if ocena >= 2 
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4
local mean3 = r(mean)
qui sum prob if ocena <= 4
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & info_demografia == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & info_demografia == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & info_demografia == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & info_demografia == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & malo_ocen == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & malo_ocen == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & malo_ocen == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & malo_ocen == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & duzo_ocen == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & duzo_ocen == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & duzo_ocen == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & duzo_ocen == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & seria_nieostatni_tom == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & seria_nieostatni_tom == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & seria_nieostatni_tom == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & seria_nieostatni_tom == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & seria_ostatni_tom == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & seria_ostatni_tom == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & seria_ostatni_tom == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & seria_ostatni_tom == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & wczesna_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & wczesna_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & wczesna_recenzja  == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & wczesna_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & pozna_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & pozna_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & pozna_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & pozna_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & krotka_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & krotka_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & krotka_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & krotka_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & dluga_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & dluga_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & dluga_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & dluga_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & literaturaobyczajowaromans  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & literaturaobyczajowaromans  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & literaturaobyczajowaromans == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & literaturaobyczajowaromans  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & kryminał  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & kryminał  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & kryminał == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & kryminał  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & literaturapiękna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & literaturapiękna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & literaturapiękna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & literaturapiękna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & fantasy  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & fantasy  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & fantasy == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & fantasy  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & sciencefiction  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & sciencefiction  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & sciencefiction == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & sciencefiction  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & fikcjahistoryczna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & fikcjahistoryczna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & fikcjahistoryczna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & fikcjahistoryczna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & thiller  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & thiller  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & thiller == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & thiller  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & dladzieci  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & dladzieci  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & dladzieci == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & dladzieci  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & chicklit  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & chicklit  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & chicklit == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & chicklit  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & horror  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & horror  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & horror == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & horror  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & manga  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & manga  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & manga == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & manga  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & powieśćgraficzna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & powieśćgraficzna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & powieśćgraficzna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & powieśćgraficzna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

drop prob
drop prob_minus
drop prob_plus

probit kontynuacja_czytania c.roznica brak_oceny i.info_demografia log_l_ocen i.seria_nieostatni_tom i.seria_ostatni_tom log_l_stron log_dlugosc_recenzji i.pozna_recenzja i.wczesna_recenzja rok_2023 rok_2022 i.literaturaobyczajowaromans i.kryminał i.literaturapiękna i.fantasy i.sciencefiction i.fikcjahistoryczna i.thiller i.dladzieci i.chicklit i.horror i.manga i.powieśćgraficzna c.roznica#i.info_demografia c.roznica#i.duzo_ocen c.roznica#i.malo_ocen c.roznica#i.seria_nieostatni_tom c.roznica#i.seria_ostatni_tom c.roznica#i.krotka_recenzja c.roznica#i.dluga_recenzja c.roznica#i.pozna_recenzja c.roznica#i.wczesna_recenzja c.roznica#i.literaturaobyczajowaromans c.roznica#i.kryminał c.roznica#i.literaturapiękna c.roznica#i.fantasy c.roznica#i.sciencefiction c.roznica#i.fikcjahistoryczna c.roznica#i.thiller c.roznica#i.dladzieci c.roznica#i.chicklit c.roznica#i.horror c.roznica#i.manga c.roznica#i.powieśćgraficzna 

probit kontynuacja_czytania c.roznica_ksiazka brak_oceny info_demografia log_l_ocen malo_ocen seria_nieostatni_tom seria_ostatni_tom log_l_stron log_dlugosc_recenzji krotka_recenzja dluga_recenzja pozna_recenzja wczesna_recenzja rok_2023 rok_2022 literaturaobyczajowaromans kryminał literaturapiękna fantasy sciencefiction fikcjahistoryczna thiller dladzieci chicklit horror manga powieśćgraficzna c.roznica_ksiazka#i.info_demografia c.roznica_ksiazka#i.duzo_ocen c.roznica_ksiazka#i.malo_ocen c.roznica_ksiazka#i.seria_nieostatni_tom c.roznica_ksiazka#i.seria_ostatni_tom c.roznica_ksiazka#i.krotka_recenzja c.roznica_ksiazka#i.dluga_recenzja c.roznica_ksiazka#i.pozna_recenzja c.roznica_ksiazka#i.wczesna_recenzja c.roznica_ksiazka#i.literaturaobyczajowaromans c.roznica_ksiazka#i.kryminał c.roznica_ksiazka#i.literaturapiękna c.roznica_ksiazka#i.fantasy c.roznica_ksiazka#i.sciencefiction c.roznica_ksiazka#i.fikcjahistoryczna c.roznica_ksiazka#i.thiller c.roznica_ksiazka#i.dladzieci c.roznica_ksiazka#i.chicklit c.roznica_ksiazka#i.horror c.roznica_ksiazka#i.manga c.roznica_ksiazka#i.powieśćgraficzna 

* MODELE PROBITOWE Z EFEKTAMI LOSOWYMI; ZMIENNA OBJAŚNIANA - kontynuacja_czytania

meprobit kontynuacja_czytania c.ocena brak_oceny i.info_demografia log_l_ocen i.seria_nieostatni_tom i.seria_ostatni_tom log_l_stron log_dlugosc_recenzji i.pozna_recenzja i.wczesna_recenzja rok_2023 rok_2022 i.literaturaobyczajowaromans i.kryminał i.literaturapiękna i.fantasy i.sciencefiction i.fikcjahistoryczna i.thiller i.dladzieci i.chicklit i.horror i.manga i.powieśćgraficzna c.ocena#i.info_demografia c.ocena#i.duzo_ocen c.ocena#i.malo_ocen c.ocena#i.seria_nieostatni_tom c.ocena#i.seria_ostatni_tom c.ocena#i.krotka_recenzja c.ocena#i.dluga_recenzja c.ocena#i.pozna_recenzja c.ocena#i.wczesna_recenzja c.ocena#i.literaturaobyczajowaromans c.ocena#i.kryminał c.ocena#i.literaturapiękna c.ocena#i.fantasy c.ocena#i.sciencefiction c.ocena#i.fikcjahistoryczna c.ocena#i.thiller c.ocena#i.dladzieci c.ocena#i.chicklit c.ocena#i.horror c.ocena#i.manga c.ocena#i.powieśćgraficzna || link_nr:

predict prob, pr
sum prob 
sum prob if info_demografia == 1
sum prob if malo_ocen == 1
sum prob if duzo_ocen == 1
sum prob if seria_nieostatni_tom == 1
sum prob if seria_ostatni_tom == 1
sum prob if wczesna_recenzja == 1
sum prob if pozna_recenzja == 1
sum prob if krotka_recenzja == 1
sum prob if dluga_recenzja == 1
sum prob if literaturaobyczajowaromans == 1
sum prob if kryminał == 1
sum prob if literaturapiękna == 1
sum prob if fantasy == 1
sum prob if sciencefiction == 1
sum prob if fikcjahistoryczna == 1
sum prob if thiller == 1
sum prob if dladzieci == 1
sum prob if chicklit == 1
sum prob if horror == 1
sum prob if manga == 1
sum prob if powieśćgraficzna == 1

gen nr = _n

qui predict prob_plus if mod(nr, 300) == 0
foreach num of numlist 1 /299 {
    if mod(nr, 300) == `num' {
    	qui replace ocena = ocena + 1 
    	qui predict prob_plus_temp 
    	qui replace prob_plus = prob_plus_temp 
    	qui drop prob_plus_temp
    	qui replace ocena = ocena -1 
}
}

qui predict prob_minus if mod(nr, 300) == 0
foreach num of numlist 1 /299 {
    if mod(nr, 300) == `num' {
    	qui replace ocena = ocena - 1 
    	qui predict prob_minus_temp 
    	qui replace prob_minus = prob_minus_temp 
    	qui drop prob_minus_temp
    	qui replace ocena = ocena + 1 
}
}


qui sum prob if ocena >= 2 
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4
local mean3 = r(mean)
qui sum prob if ocena <= 4
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & info_demografia == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & info_demografia == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & info_demografia == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & info_demografia == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & malo_ocen == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & malo_ocen == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & malo_ocen == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & malo_ocen == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & duzo_ocen == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & duzo_ocen == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & duzo_ocen == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & duzo_ocen == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & seria_nieostatni_tom == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & seria_nieostatni_tom == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & seria_nieostatni_tom == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & seria_nieostatni_tom == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & seria_ostatni_tom == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & seria_ostatni_tom == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & seria_ostatni_tom == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & seria_ostatni_tom == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & wczesna_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & wczesna_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & wczesna_recenzja  == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & wczesna_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & pozna_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & pozna_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & pozna_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & pozna_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & krotka_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & krotka_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & krotka_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & krotka_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & dluga_recenzja  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & dluga_recenzja  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & dluga_recenzja == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & dluga_recenzja  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & literaturaobyczajowaromans  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & literaturaobyczajowaromans  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & literaturaobyczajowaromans == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & literaturaobyczajowaromans  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & kryminał  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & kryminał  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & kryminał == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & kryminał  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & literaturapiękna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & literaturapiękna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & literaturapiękna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & literaturapiękna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & fantasy  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & fantasy  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & fantasy == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & fantasy  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & sciencefiction  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & sciencefiction  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & sciencefiction == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & sciencefiction  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & fikcjahistoryczna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & fikcjahistoryczna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & fikcjahistoryczna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & fikcjahistoryczna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & thiller  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & thiller  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & thiller == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & thiller  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & dladzieci  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & dladzieci  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & dladzieci == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & dladzieci  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & chicklit  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & chicklit  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & chicklit == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & chicklit  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & horror  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & horror  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & horror == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & horror  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & manga  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & manga  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & manga == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & manga  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & powieśćgraficzna  == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & powieśćgraficzna  == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & powieśćgraficzna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & powieśćgraficzna  == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

drop prob
drop prob_minus
drop prob_plus
drop nr

meprobit kontynuacja_czytania c.roznica brak_oceny i.info_demografia log_l_ocen i.seria_nieostatni_tom i.seria_ostatni_tom log_l_stron log_dlugosc_recenzji i.pozna_recenzja i.wczesna_recenzja rok_2023 rok_2022 i.literaturaobyczajowaromans i.kryminał i.literaturapiękna i.fantasy i.sciencefiction i.fikcjahistoryczna i.thiller i.dladzieci i.chicklit i.horror i.manga i.powieśćgraficzna c.roznica#i.info_demografia c.roznica#i.duzo_ocen c.roznica#i.malo_ocen c.roznica#i.seria_nieostatni_tom c.roznica#i.seria_ostatni_tom c.roznica#i.krotka_recenzja c.roznica#i.dluga_recenzja c.roznica#i.pozna_recenzja c.roznica#i.wczesna_recenzja c.roznica#i.literaturaobyczajowaromans c.roznica#i.kryminał c.roznica#i.literaturapiękna c.roznica#i.fantasy c.roznica#i.sciencefiction c.roznica#i.fikcjahistoryczna c.roznica#i.thiller c.roznica#i.dladzieci c.roznica#i.chicklit c.roznica#i.horror c.roznica#i.manga c.roznica#i.powieśćgraficzna || link_nr:

meprobit kontynuacja_czytania c.roznica_ksiazka brak_oceny info_demografia log_l_ocen malo_ocen seria_nieostatni_tom seria_ostatni_tom log_l_stron log_dlugosc_recenzji krotka_recenzja dluga_recenzja pozna_recenzja wczesna_recenzja rok_2023 rok_2022 literaturaobyczajowaromans kryminał literaturapiękna fantasy sciencefiction fikcjahistoryczna thiller dladzieci chicklit horror manga powieśćgraficzna c.roznica_ksiazka#i.info_demografia c.roznica_ksiazka#i.duzo_ocen c.roznica_ksiazka#i.malo_ocen c.roznica_ksiazka#i.seria_nieostatni_tom c.roznica_ksiazka#i.seria_ostatni_tom c.roznica_ksiazka#i.krotka_recenzja c.roznica_ksiazka#i.dluga_recenzja c.roznica_ksiazka#i.pozna_recenzja c.roznica_ksiazka#i.wczesna_recenzja c.roznica_ksiazka#i.literaturaobyczajowaromans c.roznica_ksiazka#i.kryminał c.roznica_ksiazka#i.literaturapiękna c.roznica_ksiazka#i.fantasy c.roznica_ksiazka#i.sciencefiction c.roznica_ksiazka#i.fikcjahistoryczna c.roznica_ksiazka#i.thiller c.roznica_ksiazka#i.dladzieci c.roznica_ksiazka#i.chicklit c.roznica_ksiazka#i.horror c.roznica_ksiazka#i.manga c.roznica_ksiazka#i.powieśćgraficzna || link_nr:

* WIEK I PŁEĆ

drop if missing(wiek)

meprobit kolejna_recenzja c.ocena brak_oceny log_l_ocen i.seria_nieostatni_tom i.seria_ostatni_tom log_l_stron log_dlugosc_recenzji i.pozna_recenzja i.wczesna_recenzja rok_2023 rok_2022 i.literaturaobyczajowaromans i.kryminał i.literaturapiękna i.fantasy i.sciencefiction i.fikcjahistoryczna i.thiller i.dladzieci i.chicklit i.horror i.manga i.powieśćgraficzna i.mezczyzna i.przedzial_25 i.przedzial_2534 i.przedzial_4554 i.przedzial_5564 i.przedzial_65 c.ocena#i.duzo_ocen c.ocena#i.malo_ocen c.ocena#i.seria_nieostatni_tom c.ocena#i.seria_ostatni_tom c.ocena#i.krotka_recenzja c.ocena#i.dluga_recenzja c.ocena#i.pozna_recenzja c.ocena#i.wczesna_recenzja c.ocena#i.literaturaobyczajowaromans c.ocena#i.kryminał c.ocena#i.literaturapiękna c.ocena#i.fantasy c.ocena#i.sciencefiction c.ocena#i.fikcjahistoryczna c.ocena#i.thiller c.ocena#i.dladzieci c.ocena#i.chicklit c.ocena#i.horror c.ocena#i.manga c.ocena#i.powieśćgraficzna c.ocena#i.mezczyzna c.ocena#i.przedzial_25 c.ocena#i.przedzial_2534 c.ocena#i.przedzial_4554 c.ocena#i.przedzial_5564 c.ocena#i.przedzial_65 || link_nr:

predict prob, pr
sum prob if mezczyzna == 0
sum prob if mezczyzna == 1
sum prob if przedzial_25 == 1
sum prob if przedzial_2534 == 1
sum prob if przedzial_25 == 0 & przedzial_2534 == 0 & przedzial_4554 == 0 & przedzial_5564 == 0 & przedzial_65 == 0  
sum prob if przedzial_4554 == 1
sum prob if przedzial_5564 == 1
sum prob if przedzial_65 == 1

gen nr = _n

qui predict prob_plus if mod(nr, 300) == 0
foreach num of numlist 1 /299 {
    if mod(nr, 300) == `num' {
    	qui replace ocena = ocena + 1 
    	qui predict prob_plus_temp 
    	qui replace prob_plus = prob_plus_temp 
    	qui drop prob_plus_temp
    	qui replace ocena = ocena -1 
}
}

qui predict prob_minus if mod(nr, 300) == 0
foreach num of numlist 1 /299 {
    if mod(nr, 300) == `num' {
    	qui replace ocena = ocena - 1 
    	qui predict prob_minus_temp 
    	qui replace prob_minus = prob_minus_temp 
    	qui drop prob_minus_temp
    	qui replace ocena = ocena + 1 
}
}


qui sum prob if ocena >= 2 & mezczyzna == 0
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & mezczyzna == 0
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & mezczyzna == 0
local mean3 = r(mean)
qui sum prob if ocena <= 4 & mezczyzna == 0
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & mezczyzna == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & mezczyzna == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & mezczyzna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & mezczyzna == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_25 == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_25 == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_25 == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_25 == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_2534 == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_2534 == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_2534 == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_2534 == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_25 == 0 & przedzial_2534 == 0 & przedzial_4554 == 0 & przedzial_5564 == 0 & przedzial_65 == 0  
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_25 == 0 & przedzial_2534 == 0 & przedzial_4554 == 0 & przedzial_5564 == 0 & przedzial_65 == 0  
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_25 == 0 & przedzial_2534 == 0 & przedzial_4554 == 0 & przedzial_5564 == 0 & przedzial_65 == 0  
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_25 == 0 & przedzial_2534 == 0 & przedzial_4554 == 0 & przedzial_5564 == 0 & przedzial_65 == 0  
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_4554 == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_4554 == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_4554 == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_4554 == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_5564 == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_5564 == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_5564 == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_5564 == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_65 == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_65 == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_65 == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_65 == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

drop prob
drop prob_minus
drop prob_plus
drop nr

meprobit kontynuacja_czytania c.ocena brak_oceny log_l_ocen i.seria_nieostatni_tom i.seria_ostatni_tom log_l_stron log_dlugosc_recenzji i.pozna_recenzja i.wczesna_recenzja rok_2023 rok_2022 i.literaturaobyczajowaromans i.kryminał i.literaturapiękna i.fantasy i.sciencefiction i.fikcjahistoryczna i.thiller i.dladzieci i.chicklit i.horror i.manga i.powieśćgraficzna i.mezczyzna i.przedzial_25 i.przedzial_2534 i.przedzial_4554 i.przedzial_5564 i.przedzial_65 c.ocena#i.duzo_ocen c.ocena#i.malo_ocen c.ocena#i.seria_nieostatni_tom c.ocena#i.seria_ostatni_tom c.ocena#i.krotka_recenzja c.ocena#i.dluga_recenzja c.ocena#i.pozna_recenzja c.ocena#i.wczesna_recenzja c.ocena#i.literaturaobyczajowaromans c.ocena#i.kryminał c.ocena#i.literaturapiękna c.ocena#i.fantasy c.ocena#i.sciencefiction c.ocena#i.fikcjahistoryczna c.ocena#i.thiller c.ocena#i.dladzieci c.ocena#i.chicklit c.ocena#i.horror c.ocena#i.manga c.ocena#i.powieśćgraficzna c.ocena#i.mezczyzna c.ocena#i.przedzial_25 c.ocena#i.przedzial_2534 c.ocena#i.przedzial_4554 c.ocena#i.przedzial_5564 c.ocena#i.przedzial_65 || link_nr:

predict prob, pr
sum prob if mezczyzna == 0
sum prob if mezczyzna == 1
sum prob if przedzial_25 == 1
sum prob if przedzial_2534 == 1
sum prob if przedzial_25 == 0 & przedzial_2534 == 0 & przedzial_4554 == 0 & przedzial_5564 == 0 & przedzial_65 == 0  
sum prob if przedzial_4554 == 1
sum prob if przedzial_5564 == 1
sum prob if przedzial_65 == 1

gen nr = _n

qui predict prob_plus if mod(nr, 300) == 0
foreach num of numlist 1 /299 {
    if mod(nr, 300) == `num' {
    	qui replace ocena = ocena + 1 
    	qui predict prob_plus_temp 
    	qui replace prob_plus = prob_plus_temp 
    	qui drop prob_plus_temp
    	qui replace ocena = ocena -1 
}
}

qui predict prob_minus if mod(nr, 300) == 0
foreach num of numlist 1 /299 {
    if mod(nr, 300) == `num' {
    	qui replace ocena = ocena - 1 
    	qui predict prob_minus_temp 
    	qui replace prob_minus = prob_minus_temp 
    	qui drop prob_minus_temp
    	qui replace ocena = ocena + 1 
}
}


qui sum prob if ocena >= 2 & mezczyzna == 0
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & mezczyzna == 0
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & mezczyzna == 0
local mean3 = r(mean)
qui sum prob if ocena <= 4 & mezczyzna == 0
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & mezczyzna == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & mezczyzna == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & mezczyzna == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & mezczyzna == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_25 == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_25 == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_25 == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_25 == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_2534 == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_2534 == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_2534 == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_2534 == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_25 == 0 & przedzial_2534 == 0 & przedzial_4554 == 0 & przedzial_5564 == 0 & przedzial_65 == 0  
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_25 == 0 & przedzial_2534 == 0 & przedzial_4554 == 0 & przedzial_5564 == 0 & przedzial_65 == 0  
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_25 == 0 & przedzial_2534 == 0 & przedzial_4554 == 0 & przedzial_5564 == 0 & przedzial_65 == 0  
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_25 == 0 & przedzial_2534 == 0 & przedzial_4554 == 0 & przedzial_5564 == 0 & przedzial_65 == 0  
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_4554 == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_4554 == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_4554 == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_4554 == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_5564 == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_5564 == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_5564 == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_5564 == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

qui sum prob if ocena >= 2 & przedzial_65 == 1
local mean1 = r(mean)
qui sum prob_minus if ocena >= 2 & przedzial_65 == 1
local mean2 = r(mean)
qui sum prob_plus if ocena <= 4 & przedzial_65 == 1
local mean3 = r(mean)
qui sum prob if ocena <= 4 & przedzial_65 == 1
local mean4 = r(mean)
display (`mean1' - `mean2' +  `mean3' -  `mean4')/2

drop prob
drop prob_minus
drop prob_plus
drop nr