<?php
/* @var $this ConvencionController */
/* @var $data Convencion */
$aviso=0;
?>



<div class="view">
 
    <table><tr><td>
	

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->nombre), array('convencion/view', 'id'=>$data->id));//CHtml::encode($data->nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('numero_expediente')); ?>:</b>
	<?php echo CHtml::encode($data->numero_expediente); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('inspectoria')); ?>:</b>
	<?php echo CHtml::encode($data->inspectoria0->inspectoria); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('sector')); ?>:</b>
	<?php echo CHtml::encode($data->sector0->nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ambito')); ?>:</b>
	<?php echo CHtml::encode($data->ambito0->nombre_ambito); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('edicion')); ?>:</b>
	<?php echo CHtml::encode($data->edicion); ?>
	<br />
        <b>
         <?php
            $connection = Yii::app()->db;
            $sql = "select count(id) as resultado from empresa where cod_convencion='".$data->id."'";
            $command = $connection->createCommand($sql);
            $dataReader = $command->query();
            //print_r($dataReader);
            $rows = $dataReader->readAll();
            //print_r($rows); exit();      
            if($rows[0]['resultado']==0){ 
                $aviso=1;
          ?> 
            <b><p style="color: red;">!Registro Incompleto¡. No Tiene Asociada Empresa (Para Asociar <a href=index.php?r=empresa/create&convencion=<?php echo $data->id; ?>>Aqui</a>)</p>
	<br/>
        <?php
      }else{
            //SINDICATO
            $connection = Yii::app()->db;
            $sql = "select count(id) as resultado from sindicato where cod_convencion='".$data->id."'";
            $command = $connection->createCommand($sql);
            $dataReader = $command->query();
            //print_r($dataReader);
            $rows = $dataReader->readAll();
            //print_r($rows); exit();      
            if($rows[0]['resultado']==0){ 
                $aviso=1;
          ?>
                <b><p style="color: red;">!Registro Incompleto¡. No Tiene Asociada Sindicato (Para Asociar <a href=index.php?r=sindicato/create&convencion=<?php echo $data->id; ?>>Aqui</a>)</p>
	<br/>
        <?php
                }else{
            //  NOMINA        
            $connection = Yii::app()->db;
            $sql = "select count(id) as resultado from nomina where cod_convencion='".$data->id."'";
            $command = $connection->createCommand($sql);
            $dataReader = $command->query();
            //print_r($dataReader);
            $rows = $dataReader->readAll();
             if($rows[0]['resultado']==0){ 
                $aviso=1;
             ?>
         <b><p style="color: red;">!Registro Incompleto¡. No Tiene Asociada Nomina (Para Asociar <a href=index.php?r=nomina/create&convencion=<?php echo $data->id; ?>>Aqui</a>)</p>
	<br/>
        <?php
             }
        
        
        
                    
                    
                }
          
          
          
                     
                     
                     
                     
          
      }
      
      
      
      
         ?>
        <b><a href=index.php?r=convencion/create&antecedente=<?php echo $data->id; ?>>¿Desea Crear Una Convencion Colectiva Con Antecedente?</a>
	<br/>
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
        </td><td> <?php if($aviso==0){ ?>
            <!--<?php echo CHtml::submitButton('Listar', array('submit'=>array('usuarios/list'),)); ?>

            [<?php echo CHtml::link('Agregar Empresa',array('create')); ?>]</br>
            [<?php echo CHtml::link('Agregar Sindicato',array('create')); ?>]</br>
            [<?php echo CHtml::link('Agregar Nomina',array('create')); ?>]</br>-->
<?php     $this->widget('zii.widgets.CMenu', array(
       'items'=>array(
                array(              
                        'label'=>CHtml::image(Yii::app()->request->baseUrl."/images/iconos/empresa.jpg").' Agregar Empresa',
                        'url'=>array('empresa/create&convencion='.$data->id.'&nueva=1'),
                    
                ),
            array(
                        'label'=>CHtml::image(Yii::app()->request->baseUrl."/images/iconos/sindicato.png").' Agregar Sindicato',
                        'url'=>array('Sindicato/create&convencion='.$data->id.'&nueva=1'),
                    
                ),
            array(
                        'label'=>CHtml::image(Yii::app()->request->baseUrl."/images/iconos/nomina.jpg").' Agregar Nomina',
                        'url'=>array('nomina/create&convencion='.$data->id.'&nueva=1'),
                    
                ),
        ),
        'encodeLabel' => false,
));
        }// fin de aviso
?>
            
            
            
            </td></tr></table>
</div>