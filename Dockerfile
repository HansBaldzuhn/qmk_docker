FROM hbaldzuhn/qmk_docker

ARG keyboard
ARG keymap

RUN cd qmk_firmware &&\
	make "$keyboard${keymap:+:$keymap}" &&\
	cp *.hex ..

CMD ./teensy_linux64/teensy

