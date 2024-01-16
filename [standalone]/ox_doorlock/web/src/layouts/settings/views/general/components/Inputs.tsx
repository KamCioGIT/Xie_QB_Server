import { Grid } from '@mantine/core';
import Input from './Input';
import { useStore, useSetters } from '../../../../../store';

const Inputs: React.FC = () => {
  //   const [doorName, passcode, autolockInterval, interactDistance, doorRate] = useStore((state) => [
  //     state.doorName,
  //     state.passcode,
  //     state.autolockInterval,
  //     state.interactDistance,
  //     state.doorRate,
  //   ]);
  const doorName = useStore((state) => state.name);
  const passcode = useStore((state) => state.passcode);
  const autolockInterval = useStore((state) => state.autolock);
  const interactDistance = useStore((state) => state.maxDistance);
  const doorRate = useStore((state) => state.doorRate);

  //   const [setDoorName, setPasscode, setAutolockInterval, setInteractDistance, setDoorRate] = useSetters((setter) => [
  //     setter.setDoorName,
  //     setter.setPasscode,
  //     setter.setAutolockInterval,
  //     setter.setInteractDistance,
  //     setter.setDoorRate,
  //   ]);

  const setDoorName = useSetters((setter) => setter.setName);
  const setPasscode = useSetters((setter) => setter.setPasscode);
  const setAutolockInterval = useSetters((setter) => setter.setAutolock);
  const setInteractDistance = useSetters((setter) => setter.setMaxDistance);
  const setDoorRate = useSetters((setter) => setter.setDoorRate);

  return (
    <>
      <Grid columns={2} sx={{ fontSize: 16 }}>
        <Input label="門名" type="text" value={doorName || ''} setValue={(value: string) => setDoorName(value)} />
        <Input label="密碼" type="text" value={passcode || ''} setValue={(value: string) => setPasscode(value)} />
        <Input
          label="自動鎖間隔"
          type="number"
          value={autolockInterval || 0}
          setValue={(value: number) => setAutolockInterval(value)}
          infoCircle="幾秒鐘之內的時間將鎖定門"
        />
        <Input
          label="互動距離"
          type="number"
          value={interactDistance || 0}
          setValue={(value: number) => setInteractDistance(value)}
          infoCircle="控制玩家可以與門互動的距離"
        />
        <Input
          label="門速度"
          type="number"
          span={2}
          value={doorRate || 0}
          setValue={(value: number) => setDoorRate(value)}
          infoCircle="加快自動門會移動"
        />
      </Grid>
    </>
  );
};

export default Inputs;
