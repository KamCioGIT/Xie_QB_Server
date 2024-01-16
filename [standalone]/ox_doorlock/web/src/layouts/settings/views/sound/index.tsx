import { Stack, Select } from '@mantine/core';
import { useSetters, useStore } from '../../../../store';

const Sound: React.FC = () => {
  const sounds = useSetters((state) => state.sounds);
  const lockSound = useStore((state) => state.lockSound);
  const unlockSound = useStore((state) => state.unlockSound);
  const setLockSound = useSetters((setter) => setter.setLockSound);
  const setUnlockSound = useSetters((setter) => setter.setUnlockSound);

  return (
    <Stack>
      <Select
        data={sounds}
        label="鎖聲"
        value={lockSound || ''}
        searchable
        clearable
        nothingFound="沒有這樣的聲音"
        onChange={(e) => setLockSound(e)}
      />
      <Select
        data={sounds}
        label="解鎖聲音"
        value={unlockSound || ''}
        searchable
        clearable
        nothingFound="沒有這樣的聲音"
        onChange={(e) => setUnlockSound(e)}
      />
    </Stack>
  );
};

export default Sound;
