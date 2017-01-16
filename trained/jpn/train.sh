#fonts=( TakaoExGothic TakaoGothic TakaoPGothic Lato 'Lato Bold' )
fonts=( lato latob lato.kana latob.kana hiraginokakugothicpro hiraginokakugothicstdb hiraginomarugothicpro osaka )
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

wordlist2dawg jpn.words_list jpn.word-dawg jpn.unicharset

mv shapetable jpn.shapetable
mv normproto jpn.normproto
mv inttemp jpn.inttemp
mv pffmtable jpn.pffmtable
mv unicharset jpn.unicharset

combine_tessdata jpn.

mkdir -p tessdata
mv jpn.traineddata ./tessdata

echo pgoname
tesseract pgoname.tiff test.pgoname --tessdata-dir ./ -l jpn && cat test.pgoname.txt
echo pokemonnamethres
tesseract pokemonnamethres.png test.pokemonnamethres --tessdata-dir ./ -l jpn && cat test.pokemonnamethres.txt
echo pgoname_tentacool
tesseract pgoname_tentacool.png test.pgoname_tentacool --tessdata-dir ./ -l jpn && cat test.pgoname_tentacool.txt
echo pgoname_bulbasaur
tesseract pgoname_bulbasaur.png test.pgoname_bulbasaur --tessdata-dir ./ -l jpn && cat test.pgoname_bulbasaur.txt
echo jpn.lato.exp0
tesseract jpn.lato.exp0.tif test.lato --tessdata-dir ./ -l jpn && cat test.lato.txt
echo jpn.latob.exp0
tesseract jpn.latob.exp0.tif test.latob --tessdata-dir ./ -l jpn && cat test.latob.txt
echo jpn.lato.kana
tesseract jpn.lato.kana.exp0.tif test.lato.kana --tessdata-dir ./ -l jpn && cat test.lato.kana.txt
echo jpn.latob.kana
tesseract jpn.latob.kana.exp0.tif test.latob.kana --tessdata-dir ./ -l jpn && cat test.latob.kana.txt
echo jpn.hiraginomarugothicpro
tesseract jpn.hiraginomarugothicpro.exp0.tif test.hiraginomarugothicpro  --tessdata-dir ./ -l jpn && cat test.hiraginomarugothicpro.txt
#tesseract test.tif test --tessdata-dir ./ -l jpn && cat test.txt
#tesseract testb.tif testb --tessdata-dir ./ -l jpn && cat testb.txt
#tesseract jpn.camera.tif camera --tessdata-dir ./ -l jpn && cat camera.txt