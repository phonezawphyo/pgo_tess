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
echo pgoname
tesseract pgoname.tiff test.pgoname --tessdata-dir ./ -l jpn && cat test.pgoname.txt
echo pokemonnamethres
tesseract pokemonnamethres.png test.pokemonnamethres --tessdata-dir ./ -l jpn && cat test.pokemonnamethres.txt
echo jpn.pgo_nidorino.exp0
tesseract jpn.pgo_nidorino.exp0.tif test.pgo_nidorino --tessdata-dir ./ -l jpn && cat test.pgo_nidorino.txt
echo pgoname_tentacool
tesseract pgoname_tentacool.png test.pgoname_tentacool --tessdata-dir ./ -l jpn && cat test.pgoname_tentacool.txt
echo pgoname_bulbasaur
tesseract jpn.pgo_bulbasaur.exp0.tif test.pgoname_bulbasaur --tessdata-dir ./ -l jpn && cat test.pgoname_bulbasaur.txt
echo jpn.pgo_solarbeam
tesseract jpn.pgo_solarbeam.exp0.tif test.pgo_solarbeam --tessdata-dir ./ -l jpn && cat test.pgo_solarbeam.txt
echo jpn.pgo_taiatari
tesseract jpn.pgo_taiatari.exp0.tif test.pgo_taiatari --tessdata-dir ./ -l jpn && cat test.pgo_taiatari.txt
echo jpn.pgo_powerup
tesseract jpn.pgo_powerup.exp0.tif test.pgo_powerup --tessdata-dir ./ -l jpn && cat test.pgo_powerup.txt
echo seahorse
tesseract seahorse.tiff test.seahorse --tessdata-dir ./ -l jpn && cat test.seahorse.txt
echo jpn.pgo_stoneage
tesseract jpn.pgo_stoneage.exp0.tif test.pgo_stoneage --tessdata-dir ./ -l jpn && cat test.pgo_stoneage.txt
echo jpn.pgo_hikkaku.exp0
tesseract jpn.pgo_hikkaku.exp0.tif test.pgo_hikkaku --tessdata-dir ./ -l jpn && cat test.pgo_hikkaku.txt
echo jpn.pgo_aircutter
tesseract jpn.pgo_aircutter.exp0.tif test.pgo_aircutter --tessdata-dir ./ -l jpn && cat test.pgo_aircutter.txt
echo jpn.pgo_water_cannon.exp0
tesseract jpn.pgo_water_cannon.exp0.tif test.pgo_water_cannon --tessdata-dir ./ -l jpn && cat test.pgo_water_cannon.txt
echo jpn.pgo_crosschop.exp0
tesseract jpn.pgo_crosschop.exp0.tif test.pgo_crosschop --tessdata-dir ./ -l jpn && cat test.pgo_crosschop.txt
echo jpn.pgo_cchop.exp0
tesseract jpn.pgo_cchop.exp0.tif test.pgo_crosschop --tessdata-dir ./ -l jpn && cat test.pgo_crosschop.txt
echo jpn.pgo_iwakudaki.exp0
tesseract jpn.pgo_iwakudaki.exp0.tif test.pgo_iwakudaki --tessdata-dir ./ -l jpn && cat test.pgo_iwakudaki.txt
echo jpn.cp530.exp0
tesseract jpn.cp530.exp0.tif test.cp530 --tessdata-dir ./ -l jpn && cat test.cp530.txt
echo jpn.hp39.exp0
tesseract jpn.hp39.exp0.tif test.hp39 --tessdata-dir ./ -l jpn && cat test.hp39.txt
echo jpn.hp87.exp0
tesseract jpn.hp87.exp0.tif test.hp87 --tessdata-dir ./ -l jpn && cat test.hp87.txt
echo jpn.pgo_denkou.exp0
tesseract jpn.pgo_denkou.exp0.tif test.pgo_denkou --tessdata-dir ./ -l jpn && cat test.pgo_denkou.txt
echo jpn.pgo_mudshot.exp0
tesseract jpn.pgo_mudshot.exp0.tif test.pgo_mudshot --tessdata-dir ./ -l jpn && cat test.pgo_mudshot.txt
echo jpn.pgo_ketaguri.exp0
tesseract jpn.pgo_ketaguri.exp0.tif test.pgo_ketaguri --tessdata-dir ./ -l jpn && cat test.pgo_ketaguri.txt

#tesseract test.tif test --tessdata-dir ./ -l jpn && cat test.txt
#tesseract testb.tif testb --tessdata-dir ./ -l jpn && cat testb.txt
#tesseract jpn.camera.tif camera --tessdata-dir ./ -l jpn && cat camera.txt