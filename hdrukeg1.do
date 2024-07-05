// example of dtable, etable and a local macro in a regression
// ADH 04/07/24
* load the data
sysuse auto, replace

* using dtable
dtable price weight mpg i.rep78, by(foreign) export(table1.docx, replace)

* define the predictors - you dont need to use "" but it is more readable if you do
local predictors "mpg weight turn"
* run the model
reg price `predictors'
* using etable to produce a regression table 
etable, replay cstat(_r_b, nformat(%4.2f)) cstat(_r_ci, cidelimiter(,) nformat(%6.2f)) export(table2.docx, replace)
