def test_load_objects365v1_annotations():
    tmp_dir = tempfile.TemporaryDirectory()
    fake_json_file = osp.join(tmp_dir.name, 'fake_data.json')
    _create_objects365_json(fake_json_file)

    dataset = Objects365V1Dataset(
        ann_file=fake_json_file, classes=('bus', 'car'), pipeline=[])

    # The Objects365V1Dataset do not filter the `objv2_ignore_list`
    assert len(dataset.data_infos) == 3
    tmp_dir.cleanup()
