pBackup=""
pTarget=""
seconds=""
maxBackup=""

all: build run
build:
	./build.sh $(pBackup)

run: build
	./backupd.sh $(pTarget) $(pBackup) $(seconds) $(maxBackup)
