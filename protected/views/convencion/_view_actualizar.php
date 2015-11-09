<?php
/* @var $this ConvencionController */
/* @var $data Convencion */
$aviso=0;
?>



<div class="view">
 
    <table>
        <tr bgcolor="bbbbbb" align=center>
            <td><b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b></td>
            <td><b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b></td>
            <td><b><?php echo CHtml::encode($data->getAttributeLabel('numero_expediente')); ?>:</b></td>
            <td><b><?php echo CHtml::encode($data->getAttributeLabel('inspectoria')); ?>:</b></td>
            <td><b><?php echo CHtml::encode($data->getAttributeLabel('fecha_auto_homo')); ?>:</b></td>
            <td><b><?php echo CHtml::encode($data->getAttributeLabel('cod_convencion')); ?>:</b></td>
            <td><b><?php echo CHtml::encode('Relación'); ?>:</b></td>
            <td><b><?php echo CHtml::encode('Nivel'); ?>:</b></td>
        </tr>
        <tr><td>
	<?php echo CHtml::link(CHtml::encode($data->id), array('convencion/view', 'id'=>$data->id)); ?>
        </td>
	<td>
	<?php echo CHtml::encode($data->nombre); ?>
	</td>
	<td>
        <?php echo CHtml::encode($data->numero_expediente); ?>
	</td>
        <td>
	<?php echo CHtml::encode($data->inspectoria); ?>
	</td>
        <td>
	<?php echo CHtml::encode($data->fecha_auto_homo); ?>
	</td>
        <td>
	<?php echo CHtml::encode($data->cod_convencion); ?>
	</td>
        <td>
	<?php 
            $codi=  explode('-',$data->cod_convencion);
                echo CHtml::activeDropDownList(
                Convencion::model(),
                'cod_convencion',
                CHtml::listData(
                Convencion::model()->findAll(
                array(
                'order'=>'cod_convencion',
                'condition'=>'SUBSTRING_INDEX(cod_convencion, "-", 1) = '.$codi[0].''
                )
                ),
                'id',
                'cod_convencion'
                        
                ),array(
                       'onchange'=>'element(this.value,'.$data['id'].')',
                      'options' => array($data['id'] => array('selected'=>true)),  
                        
                       ));?>
	</td>
        
        <td>
	<?php $padre=  explode('-', $data['cod_convencion']); if($padre[1]=='01') echo CHtml::encode('Padre'); else echo CHtml::encode('Hija');  ?>
	</td>
        <b>
         <?php
          /*  $connection = Yii::app()->db;
            $sql = "select count(id) as resultado from empresa where cod_convencion='".$data->id."'";
            $command = $connection->createCommand($sql);
            $dataReader = $command->query();
            //print_r($dataReader);
            $rows = $dataReader->readAll();
            //print_r($rows); exit();      
            if($rows[0]['resultado']==0){ 
                $aviso=1;*/
          ?> 
           
        <?php
      /*else{
            $connection = Yii::app()->db;
            $sql = "select count(id) as resultado from sindicato where cod_convencion='".$data->id."'";
            $command = $connection->createCommand($sql);
            $dataReader = $command->query();
            //print_r($dataReader);
            $rows = $dataReader->readAll();
            //print_r($rows); exit();      
            if($rows[0]['resultado']==0){
                 ?><b><p style="color: red;">!Registro Incompleto¡. No Tiene Asociada Empresa (Para Asociar <a href=index.php?r=empresa/create&convencion=<?php echo $data->id; ?>>Aqui</a>)</p>
            <?php
                     }
          
          
          
          
      }*/
      ?>
       
	
	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_deposito')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_deposito); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_inicio')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_inicio); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_venc')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_venc); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('duracion_meses')); ?>:</b>
	<?php echo CHtml::encode($data->duracion_meses); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_auto_homo')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_auto_homo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('costo_contrato')); ?>:</b>
	<?php echo CHtml::encode($data->costo_contrato); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('costo_contrato_sin_prestaciones')); ?>:</b>
	<?php echo CHtml::encode($data->costo_contrato_sin_prestaciones); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_convencion')); ?>:</b>
	<?php echo CHtml::encode($data->cod_convencion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('referencia')); ?>:</b>
	<?php echo CHtml::encode($data->referencia); ?>
	<br />

	*/ ?>
        </td></tr></table>
</div>