import { SimpleGrid } from '@mantine/core';
import { useSetters, useStore } from '../../../../../store';
import TooltipSwitch from './TooltipSwitch';

const Switches: React.FC = () => {
  // const checkboxes = useStore((state) => {locked: state.state,});
  const locked = useStore((state) => state.state);
  const double = useStore((state) => state.doors);
  const automatic = useStore((state) => state.auto);
  const lockpick = useStore((state) => state.lockpick);
  const hideUi = useStore((state) => state.hideUi);
  const holdOpen = useStore((state) => state.holdOpen);

  const toggleCheckbox = useSetters((setter) => setter.toggleCheckbox);

  return (
    <>
      <SimpleGrid cols={2} pt={16}>
        <TooltipSwitch
          label="鎖定"
          infoCircle="設置目標門默認是否鎖定"
          value={locked || false}
          toggle={() => toggleCheckbox('state')}
        />
        <TooltipSwitch
          label="雙門"
          infoCircle="啟用目標門是雙門"
          value={double || false}
          toggle={() => toggleCheckbox('doors')}
        />
        <TooltipSwitch
          label="自動門"
          infoCircle="啟用目標門自動移動（車庫，電線桿等...）"
          value={automatic || false}
          toggle={() => toggleCheckbox('auto')}
        />
        <TooltipSwitch
          label="可撬鎖"
          infoCircle="使目標門被鎖定。 可以在Lockpick選項卡中定義技能檢查困難，否則使用配置默認值"
          value={lockpick || false}
          toggle={() => toggleCheckbox('lockpick')}
        />
        <TooltipSwitch
          label="隱藏 UI"
          infoCircle="隱藏目標門的UI指標"
          value={hideUi || false}
          toggle={() => toggleCheckbox('hideUi')}
        />
        <TooltipSwitch
          label="保持開放"
          infoCircle="設定目標門是否應在解鎖時保持打開狀態"
          value={holdOpen || false}
          toggle={() => toggleCheckbox('holdOpen')}
        />
      </SimpleGrid>
    </>
  );
};

export default Switches;
