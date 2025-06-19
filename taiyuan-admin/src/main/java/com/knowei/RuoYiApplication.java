package com.knowei;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author ruoyi
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@Slf4j
public class RuoYiApplication {
    public static void main(String[] args) {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println(
            "\n" + " (✿◡‿◡)♡   太原启动成功！   ♡(◡‿◡✿)\n" + "  _______        __     __                 \n" + " |__   __|       \\ \\   / /                 \n" + "    | | ___  _ __ \\ \\_/ /__  _   _  ___    \n" + "    | |/ _ \\| '_ \\ \\   / _ \\| | | |/ _ \\   \n" + "    | | (_) | | | | | | (_) | |_| |  __/   \n" + "    |_|\\___/|_| |_| |_|\\___/ \\__, |\\___|   \n" + "                              __/ |        \n" + "                             |___/         \n");

    }
}
