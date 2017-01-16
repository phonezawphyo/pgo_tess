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
echo seahorse
tesseract seahorse.tiff test.seahorse --tessdata-dir ./ -l jpn && cat test.seahorse.txt
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