package main
import (
	"io/ioutil"
	"log"
	"os/exec"
)

func main(){
	compileCmd := "cp ../../udf/empty1.hh ./"
	cmd := exec.Command("/bin/sh", "-c", compileCmd)
	cmd.Dir = "./click/userlevel"
	stdout, stdoutErr1 := cmd.StdoutPipe()
	if stdoutErr1 != nil {
		log.Fatal("compiler 54 open stdout error : ", stdoutErr1)
	}
	defer stdout.Close()
	if err := cmd.Start(); err != nil {
		log.Fatal("compiler 58 compile udf cmd execute error : ", err)
	}
	opBytes, stdoutErr2 := ioutil.ReadAll(stdout)
	if stdoutErr2 != nil {
		log.Fatal("compiler 62 read stdout error : ", stdoutErr2)
	}
	log.Println(string(opBytes))
}
