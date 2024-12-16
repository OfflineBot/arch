import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { exec, subprocess, Variable } from "astal"


const cpu = Variable("").poll(1000, () => {
    try {
        const out = exec(["bash", "-c", "top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}'"]);
        return out+"%";
    } catch (err) {
        return String(err);
    }
});

const ram = Variable("").poll(1000, () => {
    try {
        const out = exec(["bash", "-c", "free | grep Mem | awk '{printf \"%.1f\", $3/$2 * 100.0}'"]);
        return out+"%";
    } catch (err) {
        return String(err);
    }
});

const volume = Variable("").poll(1000, () => {
    try {
        const out = exec(["bash", "-c", "amixer get Master | grep -o '[0-9]*%' | head -n 1"]);
        return `${out}`;
    } catch (err) {
        return String(err);
    }
});

const disk = Variable("").poll(2000, () => {
    try {
        const out = exec(["bash", "-c", "df -h / | awk 'NR==2 {print $5}'"]);
        return `${out}`;
    } catch (err) {
        return String(err);
    }
});

const gpu = Variable("").poll(1000, () => {
    try {
        const out = exec(["bash", "-c", "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits"]);
        return `${out.trim()}%`;
    } catch (err) {
        return String(err);
    }
});


const data_box = (name: string, value: Variable<string>) => {
    return <box
        className={`stats-box-${name} stats-box-item`}
        vertical={false}>
        <label label={name+":"} className={`stat-name stat-${name}`} />
        <label label={value()} className={`stat-value stat-${name}`} />
    </box>;
}


export default function Stats(gdkmonitor: number) {
    return <window
        name={`stats-${gdkmonitor}`}
        visible={false}
        className="Stats"
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        keymode={Astal.Keymode.ON_DEMAND} 
        monitor={gdkmonitor}
        anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT}
        application={App}>
        <box
            className={"stats-main-box"}
            vertical={true}>
            {data_box("GPU", gpu)}
            {data_box("CPU", cpu)}
            {data_box("RAM", ram)}
            {data_box("DISK", disk)}
            {data_box("SOUND", volume)}
        </box>
    </window>
}
