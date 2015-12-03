<?php

/**
 * This is the model class for table "tipo_clausura".
 *
 * The followings are the available columns in table 'tipo_clausura':
 * @property string $id
 * @property string $nombre_tipo_clausura
 *
 * The followings are the available model relations:
 * @property Clausuras[] $clausurases
 * @property SubTipo[] $subTipos
 */
class TipoClausura extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return TipoClausura the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tipo_clausura';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre_tipo_clausura', 'required'),
			array('nombre_tipo_clausura', 'length', 'max'=>255),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre_tipo_clausura', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'clausurases' => array(self::HAS_MANY, 'Clausuras', 'tipo_clausura'),
			'subTipos' => array(self::HAS_MANY, 'SubTipo', 'id_tipo_clausura'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombre_tipo_clausura' => 'Nombre Tipo Clausura',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('nombre_tipo_clausura',$this->nombre_tipo_clausura,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
        
        
          public function buscar_cantidad($id,$convencion) {
        
            
            $sql="select cantidad from resumen_clausuras where cod_tipo='".$id."' and cod_convencion='".$convencion."'"; 
            $resultado=Yii::app()->db->createCommand($sql)->queryRow();
            
            if ($resultado) {
                
        return $resultado['cantidad'];
    }
    return 0;
        }
        
          public function behaviors()
                {
                    return array(
                        // Classname => path to Class
                        'ActiveRecordLogableBehavior'=>
                            'application.behaviors.ActiveRecordLogableBehavior',
                    );
                }
        
        
      
        
        
}