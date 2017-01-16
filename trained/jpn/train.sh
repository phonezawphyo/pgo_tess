#make box
#tesseract --tessdata-dir ./tessdata -l jpn jpn.pgo_crosschop.exp0.tif jpn.pgo_crosschop.exp0 batch.nochop makebox

#fonts=( TakaoExGothic TakaoGothic TakaoPGothic Lato 'Lato Bold' )
fonts=( lato latob lato.kana latob.kana hiraginokakugothicpro hiraginokakugothicstdb hiraginomarugothicpro osaka pgo_nidorino pgo_bulbasaur pgo_solarbeam pgo_powerup pgo_taiatari pgo_aircutter pgo_stoneage pgo_hikkaku pgo_water_cannon pgo_denkou pgo_mudshot pgo_crosschop pgo_cchop cp530 hp39 hp87 )
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

./test.sh