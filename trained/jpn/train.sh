#make box
#tesseract --tessdata-dir ./tessdata -l jpn jpn.pgo_dratini.exp0.tif jpn.pgo_dratini.exp0 batch.nochop makebox

#fonts=( TakaoExGothic TakaoGothic TakaoPGothic Lato 'Lato Bold' )
fonts=( lato latob lato.kana latob.kana hiraginokakugothicpro hiraginokakugothicstdb hiraginomarugothicpro osaka  )
words=( pgo_nidorino pgo_nidorino2 pgo_bulbasaur pgo_solarbeam pgo_powerup pgo_taiatari pgo_aircutter pgo_stoneage pgo_hikkaku pgo_water_cannon pgo_denkou pgo_mudshot pgo_crosschop pgo_cchop pgo_iwakudaki pgo_ketaguri cp530 hp39 hp87 pgo_dratini pgo_dratini2 pgo_starmie pgo_starmie2 pgo_miltank pgo_sasuga pgo_yogilust pgo_myanmar dratini_hirasans dratini_kakub dratini_maru dratini_mincho dratini_minchob)
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

	echo base = $base_nospace
	boxes+=( "$base_nospace.box" )
	trs+=( "$base_nospace.tr" )

	echo tesseract "$base_nospace.tif" "$base_nospace" box.train
	tesseract "$base_nospace.tif" "$base_nospace" box.train
done

for i in "${words[@]}"
do
	: 
	echo "$i"
	base="jpn.${i}.exp0"
	base_nospace="$(echo -e "${base}" | tr -d '[:space:]')"
	bases+=( ${base_nospace} )

	echo base = $base_nospace
	boxes+=( "$base_nospace.box" )
	trs+=( "$base_nospace.tr" )

	echo tesseract -psm 7 "$base_nospace.tif" "$base_nospace" box.train
	tesseract -psm 7 "$base_nospace.tif" "$base_nospace" box.train
done

joined_bases=$(IFS=" " ; echo "${bases[*]}")
joined_boxes=$(IFS=" " ; echo "${boxes[*]}")
joined_trs=$(IFS=" " ; echo "${trs[*]}")


#tesseract -l jpn jpn.lato.exp0.tif jpn.lato.exp0 box.train
#tesseract -l jpn jpn.latob.exp0.tif jpn.latob.exp0 box.train
#tesseract jpn.latoi.exp0.tif jpn.latoi.exp0 box.train
#tesseract jpn.latobi.exp0.tif jpn.latobi.exp0 box.train

echo unicharset_extractor $joined_boxes
unicharset_extractor $joined_boxes

echo set_unicharset_properties -U unicharset -O unicharset --script_dir=/Users/phonephyo/projects/jTessBoxEditor/trained/langdata
set_unicharset_properties -U unicharset -O unicharset --script_dir=/Users/phonephyo/projects/jTessBoxEditor/trained/langdata

echo shapeclustering -F jpn.font_properties -U unicharset -O unicharset $joined_trs
shapeclustering -F jpn.font_properties -U unicharset -O unicharset $joined_trs

echo mftraining -F jpn.font_properties -U unicharset -O unicharset $joined_trs
mftraining -F jpn.font_properties -U unicharset -O unicharset $joined_trs

echo cntraining -F jpn.font_properties -U unicharset $joined_trs
cntraining -F jpn.font_properties -U unicharset $joined_trs

echo wordlist2dawg jpn.words_list jpn.word-dawg jpn.unicharset
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
