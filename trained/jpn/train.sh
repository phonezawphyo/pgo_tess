#fonts=( TakaoExGothic TakaoGothic TakaoPGothic Lato 'Lato Bold' )
fonts=( lato latob lato.kana latob.kana hiraginomarugothicpro hiraginokakugothicpro )
bases=()
boxes=()
trs=()

for i in "${fonts[@]}"
do
   : 
   echo "$i"
   base="jpn.${i}.exp0"
   base_nospace="$(echo -e "${base}" | tr -d '[:space:]')"
   bases+=( ${base_nospace} )
#   text2image --text=jpn.input.txt --outputbase="$base_nospace" --font="$i" --ptsize=18 --fonts_dir=/usr/share/fonts --exposure=0 --degrade_image=false --tlog_level=2

done

for i in "${bases[@]}"
do
	: 
	echo base = $i
	boxes+=( "$i.box" )
	trs+=( "$i.tr" )

	tesseract  "$i.tif" "$i" box.train

done

joined_bases=$(IFS=" " ; echo "${bases[*]}")
joined_boxes=$(IFS=" " ; echo "${boxes[*]}")
joined_trs=$(IFS=" " ; echo "${trs[*]}")


#tesseract -l jpn jpn.lato.exp0.tif jpn.lato.exp0 box.train
#tesseract -l jpn jpn.latob.exp0.tif jpn.latob.exp0 box.train
#tesseract jpn.latoi.exp0.tif jpn.latoi.exp0 box.train
#tesseract jpn.latobi.exp0.tif jpn.latobi.exp0 box.train

unicharset_extractor $joined_boxes

set_unicharset_properties -U unicharset -O unicharset --script_dir=/Users/phonephyo/projects/jTessBoxEditor/trained/langdata

shapeclustering -F jpn.font_properties -U unicharset -O unicharset $joined_trs
mftraining -F jpn.font_properties -U unicharset -O unicharset $joined_trs

cntraining -F jpn.font_properties -U unicharset $joined_trs

mv shapetable jpn.shapetable
mv normproto jpn.normproto
mv inttemp jpn.inttemp
mv pffmtable jpn.pffmtable
mv unicharset jpn.unicharset

combine_tessdata jpn.

mkdir -p tessdata
mv jpn.traineddata ./tessdata


tesseract jpn.lato.exp0.tif test.Lato --tessdata-dir ./ -l jpn && cat test.lato.txt
tesseract jpn.latob.exp0.tif test.Lato --tessdata-dir ./ -l jpn && cat test.latob.txt
tesseract jpn.lato.kana.exp0.tif test.Lato --tessdata-dir ./ -l jpn && cat test.lato.kana.txt

tesseract jpn.hiraginomarugothicpro.exp0.tif test.hiraginomarugothicpro  --tessdata-dir ./ -l jpn && cat test.hiraginomarugothicpro.txt
#tesseract test.tif test --tessdata-dir ./ -l jpn && cat test.txt
#tesseract testb.tif testb --tessdata-dir ./ -l jpn && cat testb.txt
#tesseract jpn.camera.tif camera --tessdata-dir ./ -l jpn && cat camera.txt